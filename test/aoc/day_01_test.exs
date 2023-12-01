defmodule Day01Test do
  use ExUnit.Case
  import AOC.Day01

  @sample "data/day_01/sample.txt"
  @sample2 "data/day_01/sample2.txt"
  @input "data/day_01/input.txt"

  test "part 1" do
    assert part_1(@sample) == 142
    IO.puts("Part 1: #{part_1(@input)}")
  end

  test "part 2" do
    assert part_2(@sample2) == 281
    assert real_value("oneight") == 18
    IO.puts("Part 2: #{part_2(@input)}")
  end
end
