defmodule SurfaceBootstrap.Row do
  @moduledoc """
  Row utility component, emits a `<div>` wrapper.

  https://getbootstrap.com/docs/5.0/layout/grid/
  """
  use Surface.Component

  use SurfaceBootstrap.JustifyBase

  @doc "Css classes to propagate down to row."
  prop class, :css_class, default: []

  slot default

  def render(assigns) do
    ~F"""
    <div class={["row", justify_class(@justify)] ++ @class}>
      <#slot />
    </div>
    """
  end
end
