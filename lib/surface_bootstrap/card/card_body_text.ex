defmodule SurfaceBootstrap.Card.Body.Text do
  @moduledoc """
  Card body text component

  https://getbootstrap.com/docs/5.0/components/card/
  """
  use Surface.Component

  slot default, required: true

  def render(assigns) do
    ~H"""
    <p class="card-text">
      <slot />
    </p>
    """
  end
end
