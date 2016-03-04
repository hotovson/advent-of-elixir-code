defmodule Day02 do
  def paper_feets(input) do
    input
    |> String.strip
    |> String.split("\n")
    |> Enum.map(&parse_dimensions/1)
    |> Enum.map(&compute_paper_feets/1)
    |> Enum.sum
  end

  def ribbon_feets(input) do
    input
    |> String.strip
    |> String.split("\n")
    |> Enum.map(&parse_dimensions/1)
    |> Enum.map(&compute_ribbon_feets/1)
    |> Enum.sum
  end

  defp parse_dimensions(input) do
    input
     |> String.split("x")
     |> Enum.map(&String.to_integer/1)
  end

  defp compute_paper_feets(dimensions) do
    [x,y,z] = Enum.sort(dimensions)

    3*x*y + 2*x*z + 2*y*z
  end

  defp compute_ribbon_feets(dimensions) do
    [x,y,z] = Enum.sort(dimensions)
    wrap_feets(x,y) + bow_feets(x, y, z)
  end

  defp wrap_feets(x, y), do: x + x + y + y
  defp bow_feets(x, y, z), do: x * y * z
end
