defmodule AdventOfCode.Day06Test do
  use ExUnit.Case

  import AdventOfCode.Day06

  @example_input "3,4,3,1,2"

  @final_input AdventOfCode.Input.get!(6, 2021)

  describe "part 1" do
    test "example input" do
      result = part1(@example_input)

      assert result === 5934
    end

    test "final input" do
      result = part1(@final_input)

      assert result === 350_605
    end
  end

  @tag :skip
  test "part2" do
    input = nil
    result = part2(input)

    assert result
  end
end
