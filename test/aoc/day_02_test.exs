defmodule Day02Test do
  use ExUnit.Case
  import AOC.Day02

  @sample "data/day_02/sample.txt"
  @input "data/day_02/input.txt"

  test "part 1" do
    assert part_1(@sample) == 8
    IO.puts("Part 1: #{part_1(@input)}")
  end

  test "part 2" do
    assert part_2(@sample) == 2286
    IO.puts("Part 2: #{part_2(@input)}")
  end
end
