defmodule Day06Test do
  use ExUnit.Case
  import AOC.Day06

  @moduletag timeout: :infinity

  @sample "data/day_06/sample.txt"
  @input "data/day_06/input.txt"

  test "part 1" do
    assert part_1(@sample) == 288
    IO.puts("Part 1: #{part_1(@input)}")
  end

  test "part 2" do
    assert part_2(@sample) == 71503
    IO.puts("Part 2: #{part_2(@input)}")
  end
end
