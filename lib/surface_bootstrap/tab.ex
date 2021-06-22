defmodule SurfaceBootstrap.Tab do
  @moduledoc """
  Tab component.

  This version does not support the full permutation of flexbox, if you
  require that, it is probably better to make your own tab component.

  This component only renders Tab.Item components and has no default slot.

  https://getbootstrap.com/docs/5.0/components/navs-tabs/#tabs
  """
  use Surface.Component

  @doc "Render as pills"
  prop pills, :boolean

  @doc "Equal width nav items"
  prop justified, :boolean

  @doc "Fill width of container"
  prop fill, :boolean

  @doc "Any classes to put on the nav"
  prop class, :css_class, default: []

  slot static_tab_items

  def render(assigns) do
    ~F"""
    <nav class={["nav", "nav-tabs": !@pills, "nav-pills": @pills, "nav-fill": @fill, "nav-justified": @justified] ++
      @class}>
      {#for {_tab_item, i} <- Enum.with_index(@static_tab_items)}
        <#slot name="static_tab_items" index={i} />
      {/for}
    </nav>
    """
  end
end
