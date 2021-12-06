defmodule AdventOfCode.Day05 do
  def parse_input(input) do
    input
    |> String.split(["\n", " -> ", ","], trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.chunk_every(4)
  end

  def part1(input) do
    parse_input(input)
    |> Enum.reduce(%{}, fn [x1, y1, x2, y2], acc ->
      cond do
        x1 === x2 ->
          Range.new(y1, y2)
          |> Enum.reduce(acc, fn y, next_acc ->
            Map.update(next_acc, "#{x1},#{y}", 1, &(&1 + 1))
          end)

        y1 === y2 ->
          Range.new(x1, x2)
          |> Enum.reduce(acc, fn x, next_acc ->
            Map.update(next_acc, "#{x},#{y1}", 1, &(&1 + 1))
          end)

        true ->
          acc
      end
    end)
    |> Map.values()
    |> Enum.count(&(&1 > 1))
  end

  def get_slope({x1, y1}, {x2, y2}) do
    (y2 - y1) / (x2 - x1)
  end

  def is_diagonal_line?(x1, y1, x2, y2) do
    abs(get_slope({x1, y1}, {x2, y2})) === 1.0
  end

  def part2(input) do
    parse_input(input)
    |> Enum.reduce(%{}, fn [x1, y1, x2, y2], acc ->
      cond do
        x1 === x2 ->
          Range.new(y1, y2)
          |> Enum.reduce(acc, fn y, next_acc ->
            Map.update(next_acc, "#{x1},#{y}", 1, &(&1 + 1))
          end)

        y1 === y2 ->
          Range.new(x1, x2)
          |> Enum.reduce(acc, fn x, next_acc ->
            Map.update(next_acc, "#{x},#{y1}", 1, &(&1 + 1))
          end)

        is_diagonal_line?(x1, y1, x2, y2) ->
          x_values =
            Range.new(x1, x2)
            |> Enum.to_list()

          y_values =
            Range.new(y1, y2)
            |> Enum.to_list()

          List.zip([x_values, y_values])
          |> Enum.reduce(acc, fn {x, y}, next_acc ->
            Map.update(next_acc, "#{x},#{y}", 1, &(&1 + 1))
          end)

        true ->
          acc
      end
    end)
    |> Map.values()
    |> Enum.count(&(&1 > 1))
  end
end
