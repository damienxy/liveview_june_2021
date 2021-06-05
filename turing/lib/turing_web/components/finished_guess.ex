defmodule TuringWeb.FinishedGuess do
  use Surface.Component
  alias TuringWeb.ColorItem

  prop row, :map, required: true

  def render_score(%{reds: reds, whites: whites}) do
    left = List.duplicate("✓", reds)
    right = List.duplicate("o", whites)
    left ++ right
  end

  def render(assigns) do
    ~H"""
    <div class="game-row">
      <ColorItem class="game-guess" :for={{ item <- @row.guess }} number={{ item }} />
      <div class="game-score">
        <div class="game-score-item" :for={{ score <- render_score(@row.score)}}>{{ score }}</div>
      </div>
    </div>
    """
  end
end


