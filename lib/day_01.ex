defmodule Day01 do
  def floor(input) do
    input
    |> String.graphemes
    |> Enum.reduce(0, &floor_reducer/2)
  end

  def steps_to_basement(input) do
    {_, steps} = input
    |> String.graphemes
    |> Enum.reduce_while({0, 0}, &step_reducer/2)

    steps
  end

  defp floor_reducer(cmd, floor) do
    case cmd do
      "(" -> floor + 1
      ")" -> floor - 1
      _ -> floor
    end
  end

  defp step_reducer(cmd, {floor, step}) do
    if (floor == basement_floor) do
      {:halt, {floor, step}}
    else
      {:cont, {floor_reducer(cmd, floor), step + 1}}
    end
  end

  defp basement_floor do
    -1
  end
end
