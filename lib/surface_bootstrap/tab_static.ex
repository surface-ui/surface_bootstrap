defmodule SurfaceBootstrap.TabStatic do
  @moduledoc """
  Static tabs, meant to be used when you want to control the lifecycle
  of what is 'inside' each tab yourself by setting active class and
  loading different content. Typical usage is for submenus etc.

  This version does not support the full permutation of flexbox, if you
  require that, it is probably better to make your own tab component.

  This component only renders Tab.StaticItem components and has no default slot.

  https://getbootstrap.com/docs/5.0/components/navs-tabs/#tabs
  """
  use Surface.Component

  @doc "Render as pills"
  prop pills, :boolean

  @doc "Equal width nav items"
  prop justified, :boolean

  @doc "Fill width of container"
  prop fill, :boolean

  slot static_tab_items

  def render(assigns) do
    ~H"""
    <nav
      class={{
        "nav",
        "nav-tabs": !@pills,
        "nav-pills": @pills,
        "nav-fill": @fill,
        "nav-justified": @justified
        }}
    >
      <For each={{ {_tab_item, i} <- Enum.with_index(@static_tab_items)}}>
        <slot name="static_tab_items" index={{i}} />
      </For>
    </nav>
    """
  end
end
