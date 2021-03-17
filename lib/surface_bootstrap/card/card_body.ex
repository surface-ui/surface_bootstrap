defmodule SurfaceBootstrap.Card.Body do
  @moduledoc """
  Card body component

  https://getbootstrap.com/docs/5.0/components/card/
  """
  use Surface.Component

  slot default, required: true

  def render(assigns) do
    ~H"""
    <div class="card-body">
      <slot />
    </div>
    """
  end
end
