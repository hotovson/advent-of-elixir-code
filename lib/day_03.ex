defmodule Day03 do
  def houses_with_present(input) do
    input
    |> String.strip
    |> String.codepoints
    |> get_coordinates
    |> count_uniq_cordinates
  end

  def houses_with_present_with_robo_santa(input) do
    { santa_cmds, robo_cmds } = input
    |> String.strip
    |> String.codepoints
    |> split_commands

    (get_coordinates(santa_cmds) ++ get_coordinates(robo_cmds))
    |> count_uniq_cordinates
  end

  defp count_uniq_cordinates(input) do
    input
    |> Enum.uniq
    |> Enum.count
  end

  defp get_coordinates(input), do: [starting_point] ++ get_coordinates(input, starting_point)
  defp get_coordinates([cmd | tail], coords) do
    new_coords = compute_coordinates(cmd, coords)
    [new_coords] ++ get_coordinates(tail, new_coords)
  end
  defp get_coordinates([], coords), do: []

  defp compute_coordinates(cmd, %{x: x, y: y}) do
    case cmd do
      "^" -> %{x: x, y: y + 1}
      ">" -> %{x: x + 1, y: y}
      "v" -> %{x: x, y: y - 1}
      "<" -> %{x: x - 1, y: y}
      _ -> %{x: x, y: y }
    end
  end

  defp split_commands(cmds) do
    santa_cmds = Enum.take_every(cmds, 2)
    robo_cmds = cmds -- santa_cmds
    {santa_cmds, robo_cmds}
  end

  defp starting_point do
    %{x: 0, y: 0}
  end
end
