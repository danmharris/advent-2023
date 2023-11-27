defmodule AOC.Day00 do
  def part_1(file) do
    File.read!(file)
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum()
  end

  def part_2(file) do
    File.read!(file)
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&String.to_integer/1)
    |> Enum.map(fn i -> i * 2 end)
    |> Enum.sum()
  end
end
