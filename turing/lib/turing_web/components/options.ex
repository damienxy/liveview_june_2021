defmodule TuringWeb.Option do
  use Surface.Component
  alias TuringWeb.ColorItem

  prop number, :integer, required: true

  def render(assigns) do
    ~H"""
    <button class="game-button" phx-click="choose" phx-value-ball="{{ @number }}">
      <ColorItem phx-click="choose" phx-value-ball="{{ @number }}" number={{ @number }} />
    </button>
    """
  end
end

defmodule TuringWeb.Options do
  use Surface.Component
  alias TuringWeb.Option

  def render(assigns) do
    ~H"""
    <div>
      <Option :for={{ option <- 1..8 }} number={{ option }} />
    </div>
    """
  end
end


