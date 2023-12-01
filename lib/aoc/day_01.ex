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
    all = all_digit_indexes(line) |> Enum.sort_by(fn {i, _} -> i end)
    {fi, fl} = List.first(all)
    {li, ll} = List.last(all)

    first = String.slice(line, fi, fl) |> to_num
    last = String.slice(line, li, ll) |> to_num
    (first <> last) |> String.to_integer()
  end

  defp all_digit_indexes(line) do
    [
      ~r/one/,
      ~r/two/,
      ~r/three/,
      ~r/four/,
      ~r/five/,
      ~r/six/,
      ~r/seven/,
      ~r/eight/,
      ~r/nine/,
      ~r/\d/
    ]
    |> Enum.flat_map(&scan_indexes(&1, line))
  end

  defp scan_indexes(re, line) do
    Regex.scan(re, line, return: :index) |> Enum.map(&List.first/1)
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
