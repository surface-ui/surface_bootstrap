defmodule SurfaceBootstrap.Card.ImageOverlay do
  @moduledoc """
  Card image overlay component

  https://getbootstrap.com/docs/5.0/components/card/#image-overlays
  """
  use Surface.Component

  slot default, required: true

  def render(assigns) do
    ~H"""
    <div class="card-img-overlay">
      <slot />
    </div>
    """
  end
end
