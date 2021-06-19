defmodule SurfaceBootstrap.NavBar.ItemGroup do
  @moduledoc """
  ItemGroup is a wrapper element, mainly used to adjust items left, center or right.

  Relies on content-justified classing to place things in the middle.

  Relies on ms-auto (margin start auto) and me-auto (margin end auto)
  to push things left or right.
  """
  use Surface.Component

  @doc """
  What type is the wrapper?
  Defaults to `<ul>`
  """
  prop type, :string, default: "ul", values: ["ul", "div"]

  @doc "Classes to propagate to the container ul/div."
  prop class, :css_class, default: []

  @doc "Position content on navbar (works by adding margin on opposite side)"
  prop position, :string, values: ["left", "right"]

  slot default

  def render(assigns = %{type: "div"}) do
    ~F"""
    <div class={[
      "navbar-nav",
      "me-auto": @position == "left",
      "ms-auto": @position == "right"
    ] ++ @class}>
      <#slot />
    </div>
    """
  end

  def render(assigns = %{type: "ul"}) do
    ~F"""
    <ul class={[
      "navbar-nav",
      "me-auto": @position == "left",
      "ms-auto": @position == "right"
    ] ++ @class}>
      <#slot />
    </ul>
    """
  end
end
