defmodule AdventOfCode.Day03 do
  def parse_binary_diagnosis(input) do
    String.split(input, "\n", trim: true)
    |> Enum.map(&String.graphemes/1)
  end

  def binary_to_dec(binaryString) do
    Integer.parse(binaryString, 2)
    |> elem(0)
  end

  def part1(input) do
    submarine_rates =
      parse_binary_diagnosis(input)
      |> Enum.zip()
      |> Enum.reduce(%{gamma_rate: "", epsilon_rate: ""}, fn bitsColumnTuple, acc ->
        bitsColumn = Tuple.to_list(bitsColumnTuple)

        occurrences_0 = Enum.count(bitsColumn, &(&1 == "0"))
        occurrences_1 = Enum.count(bitsColumn, &(&1 == "1"))

        if occurrences_0 < occurrences_1 do
          Map.update!(acc, :gamma_rate, &(&1 <> "0"))
          |> Map.update!(:epsilon_rate, &(&1 <> "1"))
        else
          Map.update!(acc, :gamma_rate, &(&1 <> "1"))
          |> Map.update!(:epsilon_rate, &(&1 <> "0"))
        end
      end)

    binary_to_dec(submarine_rates.gamma_rate) * binary_to_dec(submarine_rates.epsilon_rate)
  end

  def part2(input) do
  end
end
