defmodule Day00Test do
  use ExUnit.Case
  import AOC.Day00

  @sample "data/day_00/sample.txt"
  @input "data/day_00/input.txt"

  test "part 1" do
    assert part_1(@sample) == 100
    IO.puts("Part 1: #{part_1(@input)}")
  end

  test "part 2" do
    assert part_2(@sample) == 200
    IO.puts("Part 2: #{part_2(@input)}")
  end
end
