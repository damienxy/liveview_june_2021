defmodule TuringWeb.Status do
  use Surface.Component

  prop game, :any, required: true

  defp render_status(:won, _moves), do: "Congratulations, you won!"
  defp render_status(:lost, _moves), do: "No more guesses left, you lost"
  defp render_status(:playing, moves) do
    remaining_moves = 10 - length(moves)
    "#{remaining_moves} #{ if remaining_moves == 1, do: 'guess', else: 'guesses' } remaining"
  end

  def render(assigns) do
    ~H"""
    <div>{{ render_status(@game.status, @game.rows)}}</div>
    """
  end
end
