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
    games =
      File.read!(file)
      |> String.trim()
      |> String.split("\n")
      |> Enum.map(&parse_game/1)

    run_game(games)
  end

  defp run_game(games) do
    run_round(games, Enum.map(games, fn _ -> 1 end))
  end

  defp run_round(games, counts) do
    indexes = Enum.to_list(0..(length(counts) - 1))

    freqs =
      Enum.filter(indexes, fn i -> Enum.at(counts, i) > 0 end)
      |> Enum.flat_map(fn i ->
        [winning, ours] = Enum.at(games, i)
        w = MapSet.intersection(winning, ours) |> MapSet.size()

        it = 1..Enum.at(counts, i)

        Enum.flat_map(it, fn _ ->
          if w > 0 do
            Enum.to_list((i + 1)..(i + w))
          else
            []
          end
        end)
      end)
      |> Enum.frequencies()

    new = Enum.map(indexes, fn i -> Map.get(freqs, i, 0) end)
    won = Enum.any?(new, fn i -> i > 0 end)

    if won == true do
      Enum.sum(counts) + run_round(games, new)
    else
      Enum.sum(counts)
    end
  end
end
