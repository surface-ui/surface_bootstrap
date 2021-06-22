defmodule SurfaceBootstrap.NavBar.ListItem do
  @moduledoc """
  To be used inside NavBar.ItemGroup and emits as a `<li class="nav-item">` wrapper.
  """
  use Surface.Component

  @doc "Classes to propagate to the li."
  prop class, :css_class, default: []

  slot default

  def render(assigns) do
    ~F"""
    <li class={[
      "navbar-item"
    ] ++ @class}>
      <#slot />
    </li>
    """
  end
end
