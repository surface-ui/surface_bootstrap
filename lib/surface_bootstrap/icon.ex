defmodule SurfaceBootstrap.Icon do
  @moduledoc """
  Bootstrap icons, requires installation or CDN usage, see:
  https://icons.getbootstrap.com/#install
  """

  use Surface.Component

  @doc "Which icon to show"
  prop icon, :string

  def render(assigns) do
    ~H"""
    <i class={{ "bi-#{@icon}" }} />
    """
  end
end
