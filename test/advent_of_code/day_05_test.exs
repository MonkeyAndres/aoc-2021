defmodule AdventOfCode.Day05Test do
  use ExUnit.Case

  import AdventOfCode.Day05

  @example_input "0,9 -> 5,9
8,0 -> 0,8
9,4 -> 3,4
2,2 -> 2,1
7,0 -> 7,4
6,4 -> 2,0
0,9 -> 2,9
3,4 -> 1,4
0,0 -> 8,8
5,5 -> 8,2"

  @final_input AdventOfCode.Input.get!(5, 2021)

  describe "part 1" do
    test "example input" do
      result = part1(@example_input)

      assert result === 5
    end

    test "final input" do
      result = part1(@final_input)

      assert result === 7269
    end
  end

  describe "part 2" do
    test "example input" do
      result = part2(@example_input)

      assert result === 12
    end

    test "final input" do
      result = part2(@final_input)

      assert result === 21140
    end
  end
end
