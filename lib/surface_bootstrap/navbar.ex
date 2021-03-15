defmodule SurfaceBootstrap.NavBar do
  @moduledoc """
  The NavBar component.

  Can contain
  - NavBar.Brand
  - NavBar.Item


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

  @doc "Should navbar collapse on breakpoint?"
  prop collapseable, :boolean, default: true

  @doc "Nav size"
  prop nav_size, :string, values: @sizes -- ["fluid"], default: "lg"

  @doc "Container size, defaults to fluid"
  prop container_size, :string, values: @sizes, default: "fluid"

  @doc "Placement? Not set defaults  See: https://getbootstrap.com/docs/5.0/components/navbar/?#placement"
  prop placement, :string, values: ~w(fixed_top fixed_bottom sticky_top)

  @doc """
  Should navbar be scrollable in collapsed state?
  See: https://getbootstrap.com/docs/5.0/components/navbar/?#scrolling
  """
  prop scrollable_collapsed, :boolean

  @doc "Any custom style you want to add to navbar"
  prop style, :string

  @doc "Any classes to put on the nav"
  prop class, :css_class, default: []

  slot brand

  slot nav_items, required: true

  def render(assigns) do
    ~H"""
    <nav
      class={{
        ["navbar",
        "navbar-expand-#{@nav_size}",
        "navbar-#{@color_type}": @color_type,
        "bg-#{@bg_color}": @bg_color,
        "fixed-top": @placement == "fixed_top",
        "fixed-bottom": @placement == "fixed_bottom",
        "sticky-top": @placement == "sticky_top"] ++ @class
      }}
      :attrs={{ style: @style }}
    >
      <div class={{ "container-#{@container_size}" }}>
        <div class={{
          collapse: @collapseable,
          "navbar-collapse": @collapseable
        }}>
          <slot name="brand" />
          <For each={{ {alignment, group} <- item_groups(@nav_items) }}>
            <div class={{
              "navbar-nav",
              "mb-2",
              "mb-lg-0",
              "#{alignment}"
            }}>
              <For each={{ item <- group }}>
                <slot name="nav_items" index={{ item.index }} />
              </For>
            </div>
          </For>
        </div>
      </div>
    </nav>
    """
  end

  defp item_groups(items) do
    # We need unique per all items to render to slots.
    # Since we group by placement we need to store it in-situ.
    Enum.with_index(items)
    |> Enum.map(fn {i, index} ->
      Map.put(i, :index, index)
    end)
    |> Enum.group_by(fn i -> i.group end, & &1)
    |> Enum.map(fn {alignment, items} ->
      {
        alignment_class(alignment),
        items
      }
    end)
  end

  defp alignment_class(alignment) do
    case alignment do
      "left" ->
        "me-auto"

      "right" ->
        "ms-auto"

      "middle" ->
        "mx-auto"
    end
  end
end
