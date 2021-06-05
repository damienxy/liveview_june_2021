defmodule TuringWeb.CurrentGuess do
  use Surface.Component
  alias TuringWeb.ColorItem

  prop guess, :list, required: true

  def render(assigns) do
    ~H"""
    <div class="game-row">
      <ColorItem class="game-guess" 
        :for={{ item <- @guess ++ List.duplicate(0, 4) |> Enum.take(4) }} number={{ item }} />
    </div>
    """
  end
end
