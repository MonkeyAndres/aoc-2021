defmodule AdventOfCode.Day02 do
  def parse_directions(input) do
    String.split(input, "\n", trim: true)
    |> Enum.map(fn direction ->
      [direction, value] = String.split(direction, " ", trim: true)
      [direction, String.to_integer(value)]
    end)
  end

  def part1(input) do
    initial_position = %{horizontal: 0, depth: 0}

    final_position =
      parse_directions(input)
      |> Enum.reduce(initial_position, fn direction, acc ->
        case direction do
          ["forward", x] ->
            Map.update!(acc, :horizontal, &(&1 + x))

          ["up", x] ->
            Map.update!(acc, :depth, &(&1 - x))

          ["down", x] ->
            Map.update!(acc, :depth, &(&1 + x))

          _ ->
            acc
        end
      end)

    final_position.horizontal * final_position.depth
  end

  def part2(input) do
    initial_position = %{horizontal: 0, depth: 0, aim: 0}

    final_position =
      parse_directions(input)
      |> Enum.reduce(initial_position, fn direction, acc ->
        case direction do
          ["forward", x] ->
            Map.update!(acc, :horizontal, &(&1 + x))
            |> Map.update!(:depth, &(&1 + acc.aim * x))

          ["up", x] ->
            Map.update!(acc, :aim, &(&1 - x))

          ["down", x] ->
            Map.update!(acc, :aim, &(&1 + x))

          _ ->
            acc
        end
      end)

    final_position.horizontal * final_position.depth
  end
end
