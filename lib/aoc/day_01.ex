defmodule AOC.Day01 do
  def part_1(file) do
    File.read!(file)
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&value/1)
    |> Enum.sum()
  end

  def part_2(file) do
    File.read!(file)
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&real_value/1)
    |> Enum.sum()
  end

  defp value(line) do
    nums = String.split(line, "") |> Enum.filter(&String.match?(&1, ~r"\d"))
    (List.first(nums) <> List.last(nums)) |> String.to_integer()
  end

  def real_value(line) do
    matches = Regex.scan(~r"(\d|one|two|three|four|five|six|seven|eight|nine)", line)

    back_matches =
      Regex.scan(~r"(\d|eno|owt|eerht|ruof|evif|xis|neves|thgie|enin)", String.reverse(line))

    first = List.first(matches) |> List.first() |> to_num
    last = List.first(back_matches) |> List.first() |> String.reverse() |> to_num
    (first <> last) |> String.to_integer()
  end

  defp to_num("one"), do: "1"
  defp to_num("two"), do: "2"
  defp to_num("three"), do: "3"
  defp to_num("four"), do: "4"
  defp to_num("five"), do: "5"
  defp to_num("six"), do: "6"
  defp to_num("seven"), do: "7"
  defp to_num("eight"), do: "8"
  defp to_num("nine"), do: "9"
  defp to_num(n), do: n
end
