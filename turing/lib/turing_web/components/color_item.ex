defmodule TuringWeb.ColorItem do
  use Surface.Component

  prop number, :integer, required: true

  defp color(1), do: "yellow"
  defp color(2), do: "orange"
  defp color(3), do: "red"
  defp color(4), do: "darkviolet"
  defp color(5), do: "royalblue"
  defp color(6), do: "deepskyblue"
  defp color(7), do: "limegreen"
  defp color(8), do: "grey"
  defp color(_), do: "transparent"

  def render(assigns) do
    ~H"""
    <div class="game-item" style={{ "background-color": color(@number) }} />
    """
  end
end