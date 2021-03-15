defmodule SurfaceBootstrap.Card do
  @moduledoc """
  Card component

  https://getbootstrap.com/docs/5.0/components/card/
  """
  use Surface.Component

  slot default

  def render(assigns) do
    ~H"""
    <div
    >
      <slot />
    </div>
    """
  end
end
