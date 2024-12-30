import axios from 'axios';

interface GitHubGraphQLResponse {
  data: {
    user: {
      createdAt: string;
    };
  };
}

async function getGitHubAccountYear(username: string): Promise<number> {
    const token = import.meta.env.VITE_GITHUB_TOKEN as string;
  const query = `
    query {
      user(login: "${username}") {
        createdAt
      }
    }
  `;

  try {
    const response = await axios.post<GitHubGraphQLResponse>(
      'https://api.github.com/graphql',
      { query },
      {
        headers: {
          'Authorization': `Bearer ${token}`,
          'Content-Type': 'application/json',
        },
      }
    );

    const createdAt = response.data.data.user.createdAt;
    const year = new Date(createdAt).getFullYear();
    
    return year;
  } catch (error) {
    if (axios.isAxiosError(error)) {
      throw new Error(`GitHub API Error: ${error.response?.data?.message || error.message}`);
    }
    throw error;
  }
}
export default getGitHubAccountYear