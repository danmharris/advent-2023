defmodule AOC.Day04 do
  def part_1(file) do
    File.read!(file)
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&parse_game/1)
    |> Enum.map(fn [winning, ours] -> MapSet.intersection(winning, ours) end)
    |> Enum.map(&score/1)
    |> Enum.sum()
  end

  defp parse_game(line) do
    [_, nums] = String.split(line, ": ")
    String.split(nums, " | ") |> Enum.map(&space_to_nums/1)
  end

  defp space_to_nums(list) do
    String.split(list) |> Enum.map(&String.to_integer/1) |> MapSet.new()
  end

  defp score(set) do
    size = MapSet.size(set)

    if size == 0 do
      0
    else
      :math.pow(2, size - 1) |> round()
    end
  end

  def part_2(file) do
    File.read!(file)
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&parse_game/1)
    |> Enum.map(fn [winning, ours] -> MapSet.intersection(winning, ours) end)
    |> Enum.map(&MapSet.size/1)
    |> run_cards()
  end

  defp run_cards(cards) do
    initial_freqs =
      0..(length(cards) - 1)
      |> Enum.reduce(%{}, fn i, freqs -> Map.put(freqs, i, 1) end)

    run_cards(cards, initial_freqs)
  end

  defp run_cards(_cards, freqs) when freqs == %{}, do: 0

  # freqs is a map of card index => number of that card
  defp run_cards(cards, freqs) do
    num_cards = Map.values(freqs) |> Enum.sum()

    new_freqs =
      Enum.map(freqs, fn {i, freq} ->
        new_cards(cards, i, freq)
      end)
      |> sum_freqs()

    num_cards + run_cards(cards, new_freqs)
  end

  defp new_cards(cards, i, times) do
    w = Enum.at(cards, i)

    Range.new(i + 1, i + w, 1)
    |> Enum.reduce(%{}, fn i, freq -> Map.put(freq, i, times) end)
  end

  def sum_freqs(freqs) do
    Enum.reduce(freqs, %{}, fn f, acc -> Map.merge(acc, f, fn _k, f1, f2 -> f1 + f2 end) end)
  end
end
