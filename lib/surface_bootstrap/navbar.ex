defmodule SurfaceBootstrap.NavBar do
  @moduledoc """
  The NavBar component.

  Due to the massive amount of permutations possible in NavBar,
  this component focuses on the two main outer wrapping features
  of setting up a NavBar.

  1. The NavBar itself, with coloring etc
  2. The inner collapsible component NavBar.Collapse

  Using the outer without the inner is ok, you cannot use the inner
  without the outer.

  The component `DropDown` has a property that enables it to be used
  in a NavBar. This is the `wrapper` property and can be set to "nav_item".
  Please refer to the examples for usage examples.


  https://getbootstrap.com/docs/5.0/components/navbar/
  """
  use Surface.Component

  @colors ~w(primary secondary success danger warning info light dark)
  @sizes ~w(sm md lg xl xxl fluid)

  @doc """
  Color type of navbar, this essentially means if the menu items etc
  are colored to match a dark or light background. If you plan to use
  a dark bg_color you should be doing color_type=dark as well so that
  menu items etc show lightened up. This defaults to light.
  """
  prop color_type, :string, default: "light", values: ~w(light dark)

  @doc "Background color of navbar"
  prop bg_color, :string, default: "light", values: @colors

  @doc "Nav size"
  prop nav_size, :string, values: @sizes -- ["fluid"], default: "lg"

  @doc "Container size, defaults to fluid"
  prop container_size, :string, values: @sizes, default: "fluid"

  @doc "Placement? Not set defaults  See: https://getbootstrap.com/docs/5.0/components/navbar/?#placement"
  prop placement, :string, values: ~w(fixed_top fixed_bottom sticky_top)

  @doc "Any custom style you want to add to navbar"
  prop style, :string

  @doc "Any classes to put on the nav"
  prop class, :css_class, default: []

  slot brand

  slot default

  def render(assigns) do
    ~H"""
    <nav
      class={{[
        "navbar",
        "navbar-expand-#{@nav_size}",
        "navbar-#{@color_type}": @color_type,
        "bg-#{@bg_color}": @bg_color,
        "fixed-top": @placement == "fixed_top",
        "fixed-bottom": @placement == "fixed_bottom",
        "sticky-top": @placement == "sticky_top",
        "sidebar": @sidebar,
      ] ++ @class}}
      :attrs={{ style: @style }}
    >
    <div class={{"container-#{@container_size}": @container_size}}>
    <slot/>
    </div>
    </nav>
    """
  end
end
