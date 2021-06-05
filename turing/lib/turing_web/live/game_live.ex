defmodule TuringWeb.GameLive do
  use TuringWeb, :live_view
  use Surface.Component

  alias Turing.Game
  alias Turing.Game.{Board, Move}
  alias TuringWeb.{Confirm, Options, GameBoard, Status}

  # socket is actually this struct: %Socket{assigns: %{live_action: :index}}

  # Constructor function: instantiates new socket
  def mount(_params, _session, socket) do
    socket =
      socket
      |> new_board()
      |> build_move()
      |> show()
    {:ok, socket}
  end

  def new_board(socket) do
    assign(socket, board: Game.new_board())
  end

  def build_move(socket) do
    assign(socket, move: Move.new())
  end

  def make_move(socket) do
    assign(socket, board: Game.guess(socket.assigns.board, socket.assigns.move))
  end

  def choose(socket, ball) do
    assign(socket, move: Game.choose(socket.assigns.move, ball))
  end

  def show(socket) do
    assign(socket, game: Board.show(socket.assigns.board))
  end

  def render(assigns) do
    game_over = assigns.game.status != :playing
    ~H"""
    <section class="phx-hero game-view">
      <h1>Mastermind</h1>
      <Status game={{ assigns.game }} />
      <Options />
      <Confirm disabled={{ length(assigns.move) < 4 or game_over }} />
      <GameBoard game={{ assigns.game }} move={{ assigns.move }} game_over={{ game_over }}/>
    </section>
    """
  end

  def handle_event("guess", _, socket) do
    {:noreply, socket |> make_move() |> show() |> build_move()}
  end

  def handle_event("choose", %{"ball" => ball}, socket) do
    {:noreply, socket |> choose(ball)}
  end

end
