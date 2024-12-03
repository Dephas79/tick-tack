defmodule TttEngine.Board do
  alias TttEngine.Coordinates

  def new() do
    nil
    |> List.duplicate(3)
    |> List.duplicate(3)
  end

  def move(board, %Coordinates{row: _row, col: _col} = coordinates, tic) do
    board
    |> place(coordinates, tic)
    |> check_win(tic)
  end

  def check_win(board, tic) do
    case winner?(board, tic) do
      true ->
        {:win, board}

      false ->
        case is_full(board) do
          true -> {:draw, board}
          false -> {:no_win, board}
        end
    end
  end

  def is_full(board) do
    Enum.all?(board, fn row -> Enum.all?(row) end)
  end

  def place(board, %Coordinates{row: row, col: col}, tic) when row in 0..2 and col in 0..2 do
    List.update_at(board, row, fn x ->
      List.update_at(x, col, fn y ->
        case y do
          nil -> tic
          _ -> y
        end
      end)
    end)
  end

  def winner?(board, x) do
    match?([[^x, ^x, ^x], [_, _, _], [_, _, _]], board) or
      match?([[_, _, _], [^x, ^x, ^x], [_, _, _]], board) or
      match?([[_, _, _], [_, _, _], [^x, ^x, ^x]], board) or
      match?([[^x, _, _], [^x, _, _], [^x, _, _]], board) or
      match?([[_, ^x, _], [_, ^x, _], [_, ^x, _]], board) or
      match?([[_, _, ^x], [_, _, ^x], [_, _, ^x]], board) or
      match?([[^x, _, _], [_, ^x, _], [_, _, ^x]], board) or
      match?([[_, _, ^x], [_, ^x, _], [^x, _, _]], board)
  end
end
