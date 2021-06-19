defmodule SurfaceBootstrap.Icon do
  @moduledoc """
  Bootstrap icons, requires installation or CDN usage, see:
  https://icons.getbootstrap.com/#install
  """

  use Surface.Component

  @colors ~w(primary secondary success danger warning info light dark)

  @doc "Which icon to show"
  prop icon, :string

  @doc "Icon color"
  prop color, :string, values: @colors

  def render(assigns) do
    ~F"""
    <i class={"bi-#{@icon}", "text-#{@color}": @color} />
    """
  end
end
