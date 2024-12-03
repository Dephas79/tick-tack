defmodule TttEngine.BoardTest do
  use ExUnit.Case
  alias TttEngine.Board

  test "Baord-new" do
    row = [nil, nil, nil]
    assert [row, row, row] == Board.new()
  end

  test "Replace_at" do
    q = Board.new()

    x = [[nil, nil, nil], [nil, 5, nil], [nil, nil, nil]]

    assert x == Board.place(q, {1, 1}, 5)
  end

  describe "is_full/1" do
    test "is board full" do
      board = Board.new()
      refute Board.is_full(board)
    end

    test "full_board" do
      board = [["X", "X", "X"], ["X", "X", "X"], ["X", "X", "X"]]
      assert Board.is_full(board)
    end

    test "not_full_board" do
      board = [["X", "X", "X"], ["X", nil, "X"], ["X", "X", "X"]]
      Board.is_full(board)
    end
  end

  describe "winner?/2" do
    test " first row win" do
      board = [["X", "X", "X"], [nil, nil, nil], [nil, nil, nil]]
      assert Board.winner?(board, "X")
    end

    test " second row win" do
      board = [[nil, nil, nil], ["X", "X", "X"], [nil, nil, nil]]
      assert Board.winner?(board, "X")
    end

    test " third row win" do
      board = [[nil, nil, nil], [nil, nil, nil], ["X", "X", "X"]]
      assert Board.winner?(board, "X")
    end

    test " first column win" do
      board = [["X", nil, nil], ["X", nil, nil], ["X", nil, nil]]
      assert Board.winner?(board, "X")
    end

    test " second column win" do
      board = [[nil, "X", nil], [nil, "X", nil], [nil, "X", nil]]
      assert Board.winner?(board, "X")
    end

    test " third column win" do
      board = [[nil, nil, "X"], [nil, nil, "X"], [nil, nil, "X"]]
      assert Board.winner?(board, "X")
    end

    test " right diagonal win" do
      board = [["X", nil, nil], [nil, "X", nil], [nil, nil, "X"]]
      assert Board.winner?(board, "X")
    end

    test " left diagonal win" do
      board = [[nil, nil, "X"], [nil, "X", nil], ["X", nil, nil]]
      assert Board.winner?(board, "X")
    end
  end
end
