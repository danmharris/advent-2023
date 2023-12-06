defmodule AOC.Day05 do
  def part_1(file) do
    [head | tail] = File.read!(file) |> String.trim() |> String.split("\n\n")

    seeds =
      String.split(head, ": ")
      |> List.last()
      |> String.split(" ")
      |> Enum.map(&String.to_integer/1)

    maps = Enum.map(tail, &parse_maps/1)

    Enum.map(seeds, &locate(&1, maps)) |> Enum.min()
  end

  def part_2(file) do
    [head | tail] = File.read!(file) |> String.trim() |> String.split("\n\n")

    seed_chunks =
      String.split(head, ": ")
      |> List.last()
      |> String.split(" ")
      |> Enum.map(&String.to_integer/1)
      |> Enum.chunk_every(2)
      |> Enum.map(fn [start, len] -> start..(start + len - 1) end)
      |> Stream.concat()

    maps = Enum.map(tail, &parse_maps/1)

    res = Task.async_stream(seed_chunks, &locate(&1, maps), ordered: false)

    {:ok, min} = Enum.min(res)
    min
  end

  defp parse_maps(maps) do
    String.split(maps, "\n")
    |> Enum.drop(1)
    |> Enum.map(&String.split/1)
    |> Enum.map(&parse_map/1)
  end

  defp parse_map(map) do
    [dst, src, len] = Enum.map(map, &String.to_integer/1)
    {src..(src + len - 1), dst - src}
  end

  defp locate(loc, []), do: loc

  defp locate(loc, [map | maps]) do
    {_, diff} = Enum.find(map, {nil, 0}, fn {src, _} -> loc in src end)

    locate(loc + diff, maps)
  end
end
