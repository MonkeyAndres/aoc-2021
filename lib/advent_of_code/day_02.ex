defmodule AdventOfCode.Day02 do
  def parse_directions(input) do
    String.split(input, "\n", trim: true)
    |> Enum.map(fn direction ->
      [direction, value] = String.split(direction, " ", trim: true)
      [direction, String.to_integer(value)]
    end)
  end

  def part1(input) do
    parse_directions(input)
    |> Enum.reduce({_horizontal = 0, _depth = 0}, fn direction, {horizontal, depth} ->
      case direction do
        ["forward", x] ->
          {horizontal + x, depth}

        ["up", x] ->
          {horizontal, depth - x}

        ["down", x] ->
          {horizontal, depth + x}

        _ ->
          {horizontal, depth}
      end
    end)
    |> then(fn {horizontal, depth} -> horizontal * depth end)
  end

  def part2(input) do
    parse_directions(input)
    |> Enum.reduce(
      {_horizontal = 0, _depth = 0, _aim = 0},
      fn direction, {horizontal, depth, aim} ->
        case direction do
          ["forward", x] ->
            {horizontal + x, depth + aim * x, aim}

          ["up", x] ->
            {horizontal, depth, aim - x}

          ["down", x] ->
            {horizontal, depth, aim + x}

          _ ->
            {horizontal, depth, aim}
        end
      end
    )
    |> then(fn {horizontal, depth, _aim} -> horizontal * depth end)
  end
end
