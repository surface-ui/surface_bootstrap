defmodule SurfaceBootstrap.Form.InputGroupText do
  @moduledoc """
  Input group text

  https://getbootstrap.com/docs/5.0/forms/input-group/
  """
  use Surface.Component

  slot default

  def render(assigns) do
    ~H"""
    <span class="input-group-text">
      <slot />
    </span>
    """
  end
end
