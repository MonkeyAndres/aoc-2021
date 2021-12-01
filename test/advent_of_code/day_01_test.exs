defmodule AdventOfCode.Day01Test do
  use ExUnit.Case

  import AdventOfCode.Day01
  import AdventOfCode.Input

  @example_input "199
200
208
210
200
207
240
269
260
263"

  @final_input AdventOfCode.Input.get!(1, 2021)

  describe "part1" do
    test "example input" do
      result = part1(@example_input)

      assert result === 7
    end

    test "final input" do
      result = part1(@final_input)

      assert result === 1766
    end
  end

  describe "part2" do
    test "example input" do
      result = part2(@example_input)

      assert result === 5
    end

    test "final input" do
      result = part2(@final_input)

      assert result === 1797
    end
  end
end
