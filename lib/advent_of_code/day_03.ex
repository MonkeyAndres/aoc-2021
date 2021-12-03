defmodule AdventOfCode.Day03 do
  def parse_binary_diagnosis(input) do
    String.split(input, "\n", trim: true)
  end

  def binary_to_dec(binaryString) do
    Integer.parse(binaryString, 2)
    |> elem(0)
  end

  def occurrences(enumerable, pattern) do
    Enum.count(enumerable, &(&1 == pattern))
  end

  def part1(input) do
    parse_binary_diagnosis(input)
    |> Enum.map(&String.graphemes/1)
    |> Enum.zip_reduce(
      {_gamma_rate = "", _epsilon_rate = ""},
      fn bitsColumn, {gamma_rate, epsilon_rate} ->
        occurrences_0 = occurrences(bitsColumn, "0")
        occurrences_1 = occurrences(bitsColumn, "1")

        if occurrences_0 < occurrences_1 do
          {gamma_rate <> "0", epsilon_rate <> "1"}
        else
          {gamma_rate <> "1", epsilon_rate <> "0"}
        end
      end
    )
    |> then(fn {gamma_rate, epsilon_rate} ->
      binary_to_dec(gamma_rate) * binary_to_dec(epsilon_rate)
    end)
  end

  def part2(input) do
    binary_diagnosis = parse_binary_diagnosis(input)

    binary_length =
      Enum.at(binary_diagnosis, 1)
      |> String.length()

    Enum.reduce(
      0..(binary_length - 1),
      %{oxigen_generator_rating: binary_diagnosis, c02_scrubber_rating: binary_diagnosis},
      fn bitPosition, acc ->
        oxigen_generator_column =
          Enum.map(acc.oxigen_generator_rating, &String.at(&1, bitPosition))

        oxigen_generator_rating =
          Enum.filter(
            acc.oxigen_generator_rating,
            &(String.at(&1, bitPosition) ==
                if(
                  occurrences(oxigen_generator_column, "1") >=
                    occurrences(oxigen_generator_column, "0"),
                  do: "1",
                  else: "0"
                ))
          )

        c02_scrubber_column = Enum.map(acc.c02_scrubber_rating, &String.at(&1, bitPosition))

        c02_scrubber_rating =
          Enum.filter(
            acc.c02_scrubber_rating,
            &(String.at(&1, bitPosition) ==
                if(
                  occurrences(c02_scrubber_column, "0") <=
                    occurrences(c02_scrubber_column, "1"),
                  do: "0",
                  else: "1"
                ))
          )

        Map.update!(acc, :oxigen_generator_rating, fn prev ->
          if length(prev) === 1,
            do: prev,
            else: oxigen_generator_rating
        end)
        |> Map.update!(:c02_scrubber_rating, fn prev ->
          if length(prev) === 1,
            do: prev,
            else: c02_scrubber_rating
        end)
      end
    )
    |> Map.values()
    |> Enum.map(fn bitStringArray ->
      Enum.at(bitStringArray, 0)
      |> binary_to_dec()
    end)
    |> Enum.product()
  end
end
