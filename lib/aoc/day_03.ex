defmodule AOC.Day03 do
  def part_1(file) do
    grid =
      File.read!(file)
      |> String.trim()
      |> String.replace("\n", "")

    size = String.length(grid) |> :math.sqrt() |> trunc()
    symbols = find_symbols(grid)
    numbers = find_numbers(grid)

    Enum.reduce(numbers, 0, fn n, acc ->
      symbols = check_neighbours(n, symbols, size)
      {nfirst, nlen} = n

      if length(symbols) > 0 do
        acc + (String.slice(grid, nfirst, nlen) |> String.to_integer())
      else
        acc
      end
    end)
  end

  def part_2(file) do
    grid =
      File.read!(file)
      |> String.trim()
      |> String.replace("\n", "")

    size = String.length(grid) |> :math.sqrt() |> trunc()
    gears = find_gears(grid)
    numbers = find_numbers(grid)

    Enum.reduce(gears, 0, fn n, acc ->
      nums = check_neighbours(n, numbers, size)

      if length(nums) == 2 do
        nums =
          Enum.map(nums, fn {i, l} -> String.slice(grid, i, l) end)
          |> Enum.map(&String.to_integer/1)

        acc + Enum.product(nums)
      else
        acc
      end
    end)
  end

  defp find_symbols(string) do
    Regex.scan(~r/[^0-9.]/, string, return: :index)
    |> Enum.map(&List.first/1)
  end

  defp find_numbers(string) do
    Regex.scan(~r/[0-9]+/, string, return: :index)
    |> Enum.map(&List.first/1)
  end

  defp find_gears(string) do
    Regex.scan(~r/[*]/, string, return: :index)
    |> Enum.map(&List.first/1)
  end

  defp check_neighbours({nfirst, nlen}, symbols, size) do
    top = (nfirst - size - 1)..(nfirst + nlen - size)
    mid = [nfirst - 1, nfirst + nlen]
    bot = (nfirst + size - 1)..(nfirst + nlen + size)

    adjacent = Enum.to_list(top) ++ mid ++ Enum.to_list(bot)

    Enum.filter(symbols, fn {i, l} ->
      Enum.to_list(i..(i + l - 1)) |> Enum.any?(fn i -> i in adjacent end)
    end)
  end
end
