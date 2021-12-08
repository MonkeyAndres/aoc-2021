defmodule AdventOfCode.Day07Test do
  use ExUnit.Case

  import AdventOfCode.Day07

  @example_input "16,1,2,0,4,2,7,1,2,14"
  @final_input AdventOfCode.Input.get!(7, 2021)

  describe "part 1" do
    test "example input" do
      result = part1(@example_input)

      assert result === 37
    end

    test "final input" do
      result = part1(@final_input)

      assert result === 342_641
    end
  end

  describe "part 2" do
    test "example input" do
      result = part2(@example_input)

      assert result === 168
    end

    test "final input" do
      result = part2(@final_input)

      assert result === 93_006_301
    end
  end
end
