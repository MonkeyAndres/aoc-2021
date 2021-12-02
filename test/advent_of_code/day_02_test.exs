defmodule AdventOfCode.Day02Test do
  use ExUnit.Case

  import AdventOfCode.Day02

  @example_input "forward 5
down 5
forward 8
up 3
down 8
forward 2"

  @final_input AdventOfCode.Input.get!(2, 2021)

  describe "part 1" do
    test "example input" do
      result = part1(@example_input)

      assert result === 150
    end

    test "part1" do
      result = part1(@final_input)

      assert result === 1_484_118
    end
  end

  describe "part2" do
    test "example input" do
      result = part2(@example_input)

      assert result === 900
    end

    test "part2" do
      result = part2(@final_input)

      assert result === 1_463_827_010
    end
  end
end
