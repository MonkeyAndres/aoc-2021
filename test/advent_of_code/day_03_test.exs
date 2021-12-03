defmodule AdventOfCode.Day03Test do
  use ExUnit.Case

  import AdventOfCode.Day03

  @example_input "00100
11110
10110
10111
10101
01111
00111
11100
10000
11001
00010
01010"

  @final_input AdventOfCode.Input.get!(3, 2021)

  describe "part 1" do
    test "example input" do
      result = part1(@example_input)

      assert result === 198
    end

    test "final input" do
      result = part1(@final_input)

      assert result === 1_025_636
    end
  end

  describe "part 2" do
    test "example input" do
      result = part2(@example_input)

      assert result === 230
    end

    test "final input" do
      result = part2(@final_input)

      assert result === 793_873
    end
  end
end
