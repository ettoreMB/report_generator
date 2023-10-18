defmodule ReportGenerator do
  def build(filename) do
    "reports/#{filename}"
    |> File.read()
    |> handleFile()
  end

  defp handleFile({:ok, file_content}), do: file_content
  defp handleFile({:error, reason}), do: reason
end
