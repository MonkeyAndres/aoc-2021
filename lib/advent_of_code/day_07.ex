defmodule AdventOfCode.Day07 do
  def parse_input(input) do
    input
    |> String.split([",", "\n"], trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.sort()
  end

  def part1(input) do
    crabs = parse_input(input)
    final_position = Enum.at(crabs, (length(crabs) - 1) |> div(2))

    crabs
    |> Enum.reduce(0, fn crab_position, acc ->
      acc + abs(crab_position - final_position)
    end)
  end

  def part2(input) do
    crabs = parse_input(input)

    {min_position, max_position} = Enum.min_max(crabs)

    Range.new(min_position, max_position)
    |> Enum.map(fn attempted_position ->
      Enum.reduce(crabs, 0, fn crab_position, acc ->
        steps = abs(crab_position - attempted_position)

        acc + Enum.sum(1..steps)
      end)
    end)
    |> Enum.min()
  end
end
