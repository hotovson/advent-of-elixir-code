defmodule Day04 do
  def crack_secret_key(input, num_of_zeros \\ 5) do
    crack_secret_key(range, input, String.duplicate("0", num_of_zeros))
  end

  defp crack_secret_key(range, secret_key, filter_condition) do
    [{code, _}] = range
    |> Stream.map(&({&1, hash_for(&1, secret_key)}))
    |> Stream.filter(&(hash_filter(&1, filter_condition)))
    |> Enum.take(1)

    code
  end

  def crack_secret_key_p(input, num_of_zeros \\ 5) do
    range
    |> Stream.chunk(100)
    |> crack_secret_key_p(input, String.duplicate("0", num_of_zeros))
  end

  defp crack_secret_key_p(range, secret_key, filter_condition) do

    [{code, _}] = range
    |> Enum.to_list
    |> Enum.map(&({&1, hash_for(&1, secret_key)}))
    |> Enum.filter(&(hash_filter(&1, filter_condition)))
    |> Enum.take(1)

    code
  end

  defp hash_for(code, key) do
    data = key <> Integer.to_string(code)
    Base.encode16(:crypto.hash(:md5, data), case: :lower)
  end

  defp hash_filter({_, hash}, condition) do
    String.starts_with?(hash, condition)
  end

  defp range do
    1..10000000
  end
end
