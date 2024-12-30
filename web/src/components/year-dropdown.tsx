interface YearDropdownProps {
  startYear: number;
  onChange: (year: number) => void;
  value?: number;
  className?: string;
}

const YearDropdown = ({
  startYear,
  onChange,
  value,
  className = "",
}: YearDropdownProps) => {
  const currentYear = new Date().getFullYear();
  const years = Array.from(
    { length: currentYear - startYear + 1 },
    (_, index) => currentYear - index
  );

  return (
    <select
      value={value}
      onChange={(e) => onChange(Number(e.target.value))}
      className={`block w-full rounded-md border border-gray-300 px-3 py-2 text-gray-700 
                 focus:border-blue-500 focus:outline-none focus:ring-1 focus:ring-blue-500 
                 ${className}`}
    >
      <option value="">Select Year</option>
      {years.map((year) => (
        <option key={year} value={year}>
          {year}
        </option>
      ))}
    </select>
  );
};

export default YearDropdown;
