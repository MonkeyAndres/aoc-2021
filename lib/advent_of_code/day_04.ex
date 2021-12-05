defmodule AdventOfCode.Day04 do
  def parse_bingo_data(input) do
    input
    |> String.split("\n\n", trim: true)
    |> then(fn [draw_numbers | boards] ->
      {
        String.split(draw_numbers, ",", trim: true),
        Enum.map(
          boards,
          fn board ->
            String.split(board, ["\n", " "], trim: true)
            |> Enum.chunk_every(5)
          end
        )
      }
    end)
  end

  def mark_number_in_boards(boards, draw_number) do
    Enum.map(boards, fn board ->
      Enum.map(board, fn row ->
        Enum.map(row, fn number ->
          if number === draw_number, do: "X", else: number
        end)
      end)
    end)
  end

  def calculate_final_result(winning_board, current_draw) do
    List.flatten(winning_board)
    |> Enum.reduce(0, fn element, acc ->
      if element != "X" do
        acc + String.to_integer(element)
      else
        acc
      end
    end)
    |> then(&(&1 * String.to_integer(current_draw)))
  end

  def check_winning_board(board) do
    has_winning_row =
      Enum.any?(
        board,
        fn row -> Enum.all?(row, &(&1 === "X")) end
      )

    has_winning_column =
      Enum.zip_with(board, &Function.identity/1)
      |> Enum.any?(fn column -> Enum.all?(column, &(&1 === "X")) end)

    has_winning_row or has_winning_column
  end

  def part1(input) do
    {draw_numbers, boards} = parse_bingo_data(input)

    Enum.reduce_while(draw_numbers, boards, fn current_draw, boards ->
      next_boards = mark_number_in_boards(boards, current_draw)
      winning_board = Enum.find(next_boards, &check_winning_board/1)

      if winning_board do
        {
          :halt,
          calculate_final_result(winning_board, current_draw)
        }
      else
        {:cont, next_boards}
      end
    end)
  end

  def part2(input) do
    {draw_numbers, boards} = parse_bingo_data(input)

    Enum.reduce_while(draw_numbers, boards, fn current_draw, boards ->
      next_boards = mark_number_in_boards(boards, current_draw)

      [first_board | _rest] = next_boards

      cond do
        length(next_boards) == 1 && check_winning_board(first_board) ->
          {
            :halt,
            calculate_final_result(first_board, current_draw)
          }

        true ->
          Enum.reject(next_boards, &check_winning_board/1)
          |> then(fn next_boards ->
            {:cont, next_boards}
          end)
      end
    end)
  end
end
