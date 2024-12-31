import axios from 'axios';

interface ContributionDay {
  contributionCount: number;
  date: string;
  color: string;
}

interface ContributionWeek {
  contributionDays: ContributionDay[];
  firstDay: string;
}

interface ContributionCalendar {
  totalContributions: number;
  weeks: ContributionWeek[];
}

interface GitHubResponse {
  data: {
    user: {
      contributionsCollection: {
        contributionCalendar: ContributionCalendar;
      };
    };
  };
}

export async function fetchGitHubContributions(
  username: string,
  fromDate?: string,
  toDate?: string
): Promise<ContributionCalendar> {
  const token = import.meta.env.VITE_GITHUB_TOKEN as string;

  const formatDateForGitHub = (dateString: string): string => {
    // ISO 8601 
    return `${dateString}T00:00:00Z`;
  };

  const query = `
    query($username: String!, $from: DateTime, $to: DateTime) {
      user(login: $username) {
        contributionsCollection(from: $from, to: $to) {
          contributionCalendar {
            totalContributions
            weeks {
              contributionDays {
                contributionCount
                date
                color
              }
              firstDay
            }
          }
        }
      }
    }
  `;

  const variables = {
    username,
    from: fromDate ? formatDateForGitHub(fromDate) : undefined,
    to: toDate ? formatDateForGitHub(toDate) : undefined,
  };

  try {
    const response = await axios.post<GitHubResponse>(
      'https://api.github.com/graphql',
      {
        query,
        variables,
      },
      {
        headers: {
          Authorization: `Bearer ${token}`,
          'Content-Type': 'application/json',
        },
      }
    );

    return response.data.data.user.contributionsCollection.contributionCalendar;
  } catch (error) {
    if (axios.isAxiosError(error)) {
      throw new Error(`GitHub API Error: ${error.response?.data?.message || error.message}`);
    }
    throw error;
  }
}