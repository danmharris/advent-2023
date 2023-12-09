defmodule AOC.Day06 do
  def part_1(file) do
    File.read!(file)
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&String.split/1)
    |> Enum.map(&Enum.drop(&1, 1))
    |> Enum.map(fn ints -> Enum.map(ints, &String.to_integer/1) end)
    |> Enum.zip()
    |> Enum.map(&run_race/1)
    |> Enum.product()
  end

  def part_2(file) do
    File.read!(file)
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&String.split(&1, ":"))
    |> Enum.map(&Enum.drop(&1, 1))
    |> Enum.map(fn [int] -> [String.replace(int, " ", "") |> String.to_integer()] end)
    |> Enum.zip()
    |> Enum.map(&run_race/1)
    |> List.first()
  end

  defp run_race({time, dist}) do
    0..time
    |> Enum.map(fn t -> (time - t) * t end)
    |> Enum.filter(fn d -> d > dist end)
    |> length()
  end
end
