defmodule AdventOfCode.Day06 do
  def parse_input(input) do
    String.split(input, [",", "\n"], trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  def reproduce_fishes(fishes) do
    Enum.flat_map(fishes, fn fish_age ->
      if fish_age === 0 do
        [6, 8]
      else
        [fish_age - 1]
      end
    end)
  end

  def part1(input) do
    initial_fishes = parse_input(input)

    Enum.reduce(0..79, initial_fishes, fn _day, fishes ->
      reproduce_fishes(fishes)
    end)
    |> length()
  end

  def part2(args) do
  end
end
