defmodule Day03Test do
  use ExUnit.Case
  import AOC.Day03

  @sample "data/day_03/sample.txt"
  @input "data/day_03/input.txt"

  test "part 1" do
    assert part_1(@sample) == 4361
    IO.puts("Part 1: #{part_1(@input)}")
  end

  test "part 2" do
    assert part_2(@sample) == 467_835
    IO.puts("Part 2: #{part_2(@input)}")
  end
end
