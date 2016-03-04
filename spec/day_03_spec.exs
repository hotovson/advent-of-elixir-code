defmodule Day03Spec do
  use ESpec

  it do: expect(Day03.houses_with_present(">")).to eq(2)
  it do: expect(Day03.houses_with_present("^>v<")).to eq(4)
  it do: expect(Day03.houses_with_present("^v^v^v^v^v")).to eq(2)

  it do: expect(Day03.houses_with_present_with_robo_santa("^v")).to eq(3)
  it do: expect(Day03.houses_with_present_with_robo_santa("^>v<")).to eq(3)
  it do: expect(Day03.houses_with_present_with_robo_santa("^v^v^v^v^v")).to eq(11)
end

# > delivers presents to 2 houses: one at the starting location, and one to the east.
# ^>v< delivers presents to 4 houses in a square, including twice to the house at his starting/ending location.
# ^v^v^v^v^v delivers a bunch of presents to some very lucky children at only 2 houses.

# ^v delivers presents to 3 houses, because Santa goes north, and then Robo-Santa goes south.
# ^>v< now delivers presents to 3 houses, and Santa and Robo-Santa end up back where they started.
# ^v^v^v^v^v now delivers presents to 11 houses, with Santa going one direction and Robo-Santa going the other.
