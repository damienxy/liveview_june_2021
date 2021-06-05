defmodule TuringWeb.Confirm do
  use Surface.Component

  prop disabled, :boolean, required: true

  def render(assigns) do
    ~H"""
    <button phx-click="guess" disabled={{ @disabled }}>Guess</button>
    """
  end
end
