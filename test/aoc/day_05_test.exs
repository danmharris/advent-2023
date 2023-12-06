defmodule Day05Test do
  use ExUnit.Case
  import AOC.Day05

  @moduletag timeout: :infinity

  @sample "data/day_05/sample.txt"
  @input "data/day_05/input.txt"

  test "part 1" do
    assert part_1(@sample) == 35
    IO.puts("Part 1: #{part_1(@input)}")
  end

  test "part 2" do
    assert part_2(@sample) == 46
    IO.puts("Part 2: #{part_2(@input)}")
  end
end
