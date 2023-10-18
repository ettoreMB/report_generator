defmodule ReportGenerator do
  def build(filename) do
    "reports/#{filename}"
    |> File.stream!()
    |> Enum.reduce(%{}, fn ln, report ->
      [id, _food_name, price] = parse_line(ln)
      Map.put(report, id, price)
    end)
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(2, &String.to_integer/1)

    # |> List.update_at(2, fn el -> String.to_integer(el)end)
  end
end
