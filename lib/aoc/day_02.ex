defmodule AOC.Day02 do
  def part_1(file) do
    File.read!(file)
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&run_game/1)
    |> Enum.sum()
  end

  defp run_game(line) do
    re = ~r"Game (\d+): (.+)"

    [id, cubes] = Regex.run(re, line, capture: :all_but_first)
    valid = String.split(cubes, "; ") |> Enum.all?(&valid_hand?/1)

    case valid do
      true -> String.to_integer(id)
      false -> 0
    end
  end

  defp valid_hand?(hand) do
    String.split(hand, ", ") |> Enum.all?(&valid_cubes?/1)
  end

  defp valid_cubes?(cubes) do
    re = ~r"(\d+) (red|green|blue)"
    [count, colour] = Regex.run(re, cubes, capture: :all_but_first)
    valid?(String.to_integer(count), colour)
  end

  defp valid?(c, "red") when c > 12, do: false
  defp valid?(c, "red") when c <= 12, do: true
  defp valid?(c, "green") when c > 13, do: false
  defp valid?(c, "green") when c <= 13, do: true
  defp valid?(c, "blue") when c > 14, do: false
  defp valid?(c, "blue") when c <= 14, do: true

  def part_2(file) do
    File.read!(file)
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&power/1)
    |> Enum.sum()
  end

  defp power(game) do
    re = ~r"(\d+) (red|green|blue)"
    cubes = Regex.scan(re, game, capture: :all_but_first)
    max_cubes(cubes, "blue") * max_cubes(cubes, "green") * max_cubes(cubes, "red")
  end

  defp max_cubes(cubes, colour) do
    Enum.filter(cubes, fn [_, c] -> c == colour end)
    |> Enum.map(&List.first/1)
    |> Enum.map(&String.to_integer/1)
    |> Enum.max()
  end
end
