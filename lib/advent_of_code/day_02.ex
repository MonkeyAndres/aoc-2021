defmodule AdventOfCode.Day02 do
  def part1(input) do
    String.split(input, "\n", trim: true)
    |> Enum.map(fn direction ->
      [direction, value] = String.split(direction, " ", trim: true)
      [direction, String.to_integer(value)]
    end)
    |> Enum.reduce(%{horizontal: 0, depth: 0}, fn direction, acc ->
      case direction do
        ["forward", x] -> %{horizontal: acc.horizontal + x, depth: acc.depth}
        ["up", x] -> %{horizontal: acc.horizontal, depth: acc.depth - x}
        ["down", x] -> %{horizontal: acc.horizontal, depth: acc.depth + x}
        _ -> acc
      end
    end)
    |> Map.values()
    |> Enum.product()
  end

  def part2(args) do
  end
end
