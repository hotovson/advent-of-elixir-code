defmodule Day05 do
  def nice_strings_count(input) do
    input
    |> String.strip
    |> String.split("\n")
    |> Enum.map(&nice_or_naughty/1)
    |> Enum.filter(&(&1 == :nice))
    |> Enum.count
  end

  def nice_or_naughty(input) do
    if is_nice?(input), do: :nice, else: :naughty
  end

  defp is_nice?(input) do
    {_, all?} = {input, true}
    |> has_vovels_at_least(3)
    |> has_twins_at_least(1)
    |> not_contain_strings(~w{ab cd pq xy})

    all?
  end

  defp has_vovels_at_least({input, all?}, limit) do
    vovels_count = Regex.scan(~r/(a|e|i|o|u)/, input)
    |> Enum.count

    {input, all? && (vovels_count >= limit)}
  end

  defp has_twins_at_least({input, all?}, limit) do
    twins_count = input
    |> String.codepoints
    |> filter_twins
    |> Enum.count

    {input, all? && (twins_count >= limit)}
  end

  defp not_contain_strings({input, all?}, strings) do
    strings_count = Regex.scan(~r/(#{Enum.join(strings, "|")})/, input)
    |> Enum.count

    {input, all? && (strings_count == 0)}
  end

  defp filter_twins([]), do: []
  defp filter_twins([grapheme | tail]), do: filter_twins(grapheme, tail)
  defp filter_twins(grapheme, [next_grapheme | tail]) do
    twin = if grapheme == next_grapheme, do: [grapheme], else: []
    twin ++ filter_twins(next_grapheme, tail)
  end
  defp filter_twins(_, []), do: []
end
