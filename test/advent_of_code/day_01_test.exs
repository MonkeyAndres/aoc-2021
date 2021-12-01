defmodule AdventOfCode.Day01Test do
  use ExUnit.Case

  import AdventOfCode.Day01
  import AdventOfCode.Input

  describe "part1" do
    test "example 1" do
      input = "199
200
208
210
200
207
240
269
260
263"

      result = part1(input)

      assert result === 7
    end

    test "final input" do
      input = AdventOfCode.Input.get!(1, 2021)
      result = part1(input)

      assert result === 1766
    end
  end

  test "part2" do
    input = nil
    result = part2(input)

    assert result
  end
end
