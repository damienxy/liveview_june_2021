defmodule Turing.Game do
  alias Turing.Game.{Board, Move}

  def new_board() do
    Board.new(random_answer())
  end

  def random_answer() do
    (1..8)
    |> Enum.shuffle
    |> Enum.take(4)
  end

  def start_move() do
    Move.new()
  end

  def guess(board, move) do
    Board.make_move(board, move)
  end

  def choose(balls, ball) do
    Move.add(balls, String.to_integer(ball))
  end

  def remove_last(balls) do
    Move.remove(balls)
  end

  def delete(balls) do
    Move.remove(balls)
  end

  def show(board) do 
    Board.show(board)
  end
end 