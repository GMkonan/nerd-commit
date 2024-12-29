import "./App.css";
import ActivityCalendar from "react-activity-calendar";

function App() {
  const data = [
    {
      date: "2024-01-01", // start
      count: 0,
      level: 0,
    },
    {
      date: "2023-01-12",
      count: 2,
      level: 1,
    },
    {
      date: "2024-12-31", // end, all days in between are filled with empty data
      count: 0,
      level: 0,
    },
  ];
  return (
    <div>
      <ActivityCalendar
        colorScheme="light"
        data={data}
        eventHandlers={{
          onClick: (event) => (activity) => {
            alert(JSON.stringify(activity));
          },
          onMouseEnter: (event) => (activity) => {
            console.log("on mouse enter");
          },
        }}
      />
    </div>
  );
}

export default App;
