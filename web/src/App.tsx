import { useState } from "react";
import "./App.css";
import ActivityCalendar from "react-activity-calendar";
import { fetchGitHubContributions } from "./utils/fetch-github-contributions";
import { format } from "date-fns";
import axios from "axios";
import getGitHubAccountYear from "./utils/get-github-account-year";
import YearDropdown from "./components/year-dropdown";

type GraphType = {
  date: string;
  count: number;
  level: number;
};

function App() {
  const [value, setValue] = useState("");
  const [year, setYear] = useState<number | null>(null);
  const [startYear, setStartYear] = useState<number | null>(null);
  const [data, setData] = useState<GraphType[]>([
    // initial data so the calendar actually renders
    {
      date: "2024-01-01", // start
      count: 0,
      level: 0,
    },
    {
      date: "2024-12-31", // end, all days in between are filled with empty data
      count: 0,
      level: 0,
    },
  ]);

  const handleClick = (username: string) => {
    getGitHubAccountYear(username).then((d) => setStartYear(d));
    fetchGitHubContributions(username).then((data) => {
      console.log(data);
      const graphData: GraphType[] = [];
      data.weeks.forEach((week) => {
        week.contributionDays.forEach((day) => {
          graphData.push({
            date: day.date,
            count: day.contributionCount,
            level: 0,
          });
        });
      });
      setData(graphData);
    });
  };

  const handleExport = (data: GraphType[]) => {
    // get the current highest commit day and double it to ensure ultimate color
    let highestCount = Math.max(...data.map((d) => d.count)) * 2;
    if (highestCount === 0) {
      highestCount = 10;
    }
    const selectedDates = data.filter((d) => d.level === 4);
    const formattedDates = selectedDates.map((d) => format(d.date, "MM.dd"));
    console.log("Selected Dates", { selectedDates });

    console.log("Commit count for each:", { highestCount });
    console.log("Dates:", { formattedDates });
    axios.post("http://localhost:3000", {
      dates: formattedDates,
      count: highestCount,
      year: year,
    });
  };

  return (
    <div>
      <div>
        <h3>Insert github username</h3>
        {startYear && (
          <YearDropdown startYear={startYear} onChange={(y) => setYear(y)} />
        )}

        <input
          type="text"
          value={value}
          onChange={(e) => setValue(e.target.value)}
          placeholder="username"
        />
        <button onClick={() => handleClick(value)}>Submit</button>
      </div>
      <ActivityCalendar
        colorScheme="light"
        data={data}
        eventHandlers={{
          onClick: () => (activity) => {
            const activityData = data.find((d) => d.date === activity.date);
            if (activityData) {
              if (activityData.level === 4) {
                activityData.level = 0;
              } else {
                activityData.level = 4;
              }

              setData([...data]);
            }
          },
        }}
      />
      <div>
        <button onClick={() => handleExport(data)}>Export</button>
      </div>
    </div>
  );
}

export default App;
