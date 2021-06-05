defmodule TuringWeb.Back do
  use Surface.Component

  prop disabled, :boolean, required: true

  def render(assigns) do
    ~H"""
    <button phx-click="back" disabled={{ @disabled }}>⤺</button>
    """
  end
end
