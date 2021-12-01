defmodule AdventOfCode.Day01 do
  def input_to_list_of_numbers(input) do
    String.split(input, "\n", trim: true)
    |> Enum.map(fn element -> String.to_integer(element) end)
  end

  def get_enum_range(enumerable) do
    0..(length(enumerable) - 1)
  end

  def calculate_greater_than_prev(numbers) do
    Enum.reduce(get_enum_range(numbers), 0, fn index, acc ->
      prev = Enum.at(numbers, index - 1)
      actual = Enum.at(numbers, index)

      cond do
        actual > prev ->
          acc + 1

        true ->
          acc
      end
    end)
  end

  def part1(input) do
    input_to_list_of_numbers(input)
    |> calculate_greater_than_prev
  end

  def part2(input) do
    numbers = input_to_list_of_numbers(input)

    numbers
    |> get_enum_range
    |> Enum.map(fn index ->
      n1 = Enum.at(numbers, index)
      n2 = Enum.at(numbers, index + 1)
      n3 = Enum.at(numbers, index + 2)

      if n1 && n2 && n3 do
        n1 + n2 + n3
      end
    end)
    |> Enum.filter(&(!is_nil(&1)))
    |> calculate_greater_than_prev
  end
end
