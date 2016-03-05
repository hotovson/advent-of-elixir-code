defmodule Day04Spec do
  use ESpec

  it do: expect(Day04.crack_secret_key("abcdef")).to eq(609043)
  it do: expect(Day04.crack_secret_key("pqrstuv")).to eq(1048970)
end

# If your secret key is abcdef, the answer is 609043, because the MD5 hash of abcdef609043 starts with five zeroes (000001dbbfa...), and it is the lowest such number to do so.
# If your secret key is pqrstuv, the lowest number it combines with to make an MD5 hash starting with five zeroes is 1048970; that is, the MD5 hash of pqrstuv1048970 looks like 000006136ef....
