defmodule TuringWeb.GameBoard do
  use Surface.Component
  alias TuringWeb.{ CurrentGuess, FinishedGuess }

  prop game, :map, required: true
  prop move, :list, required: true
  prop game_over, :boolean, required: true

  def render(assigns) do
    ~H"""
    <div class="game-board">
      <CurrentGuess :if={{ !@game_over }} guess={{ @move }} />
      <FinishedGuess :for={{ row <- @game.rows }} row={{ row }} />
    </div>
    """
  end
end