defmodule Day01Spec do
  use ESpec

  it do: expect(Day01.floor("(())")).to eq(0)
  it do: expect(Day01.floor("()()")).to eq(0)
  it do: expect(Day01.floor("(((")).to eq(3)
  it do: expect(Day01.floor("(()(()(")).to eq(3)
  it do: expect(Day01.floor("))(((((")).to eq(3)
  it do: expect(Day01.floor("())")).to eq(-1)
  it do: expect(Day01.floor("))(")).to eq(-1)
  it do: expect(Day01.floor(")))")).to eq(-3)
  it do: expect(Day01.floor(")())())")).to eq(-3)

  it do: expect(Day01.steps_to_basement(")")).to eq(1)
  it do: expect(Day01.steps_to_basement("()())")).to eq(5)
end

# (()) and ()() both result in floor 0.
# ((( and (()(()( both result in floor 3.
# ))((((( also results in floor 3.

# ()) and ))( both result in floor -1 (the first basement level).
# ))) and )())()) both result in floor -3.
