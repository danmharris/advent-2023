defmodule Day04Test do
  use ExUnit.Case
  import AOC.Day04

  @sample "data/day_04/sample.txt"
  @input "data/day_04/input.txt"

  test "part 1" do
    assert part_1(@sample) == 13
    IO.puts("Part 1: #{part_1(@input)}")
  end

  test "part 2" do
    assert part_2(@sample) == 30
    IO.puts("Part 2: #{part_2(@input)}")
  end
end
