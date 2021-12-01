defmodule AdventOfCode.Day01 do
  def part1(input) do
    String.split(input, "\n", trim: true)
    |> Enum.map(fn element -> String.to_integer(element) end)
    |> Enum.reduce(
      %{last_element: nil, larger_than_prev: 0},
      fn element, acc ->
        cond do
          element > acc.last_element ->
            %{last_element: element, larger_than_prev: acc.larger_than_prev + 1}

          true ->
            %{last_element: element, larger_than_prev: acc.larger_than_prev}
        end
      end
    )
    |> Map.get(:larger_than_prev)
  end

  def part2(input) do
  end
end
