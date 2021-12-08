defmodule AdventOfCode.Day07 do
  def part1(input) do
    crabs =
      input
      |> String.split([",", "\n"], trim: true)
      |> Enum.map(&String.to_integer/1)
      |> Enum.sort()

    final_position = Enum.at(crabs, (length(crabs) - 1) |> div(2))

    crabs
    |> Enum.reduce(0, fn crab_position, acc ->
      acc + abs(crab_position - final_position)
    end)
  end

  def part2(args) do
  end
end
