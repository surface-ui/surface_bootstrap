defmodule SurfaceBootstrap.Breadcrumb do
  use Surface.Component

  @moduledoc """
  Can take a list of breadcrumb maps with keys `url`, `text` and `active`
  or a slot list of `Breadcrumb.Item`.
  """

  alias Surface.Components.{Link, LiveRedirect, LivePatch}
  @doc "What kind of link to be rendered? `Link`, `LiveRedirect` or `LivePatch`."
  prop link_type, :string, required: true, values: ~w(link live_redirect live_patch)

  prop breadcrumbs, :list, default: []
  slot items

  def render(assigns = %{breadcrumbs: [_ | _]}) do
    ~F"""
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        {#for item <- @breadcrumbs}
          <li class={["breadcrumb-item", active: item[:active]]} >
          {#if @link_type == "link" && !is_nil(item[:url])}
          <Link to={item.url}>{item.text}</Link>
          {/if}
    
          {#if @link_type == "live_redirect" && !is_nil(item[:url])}
          <LiveRedirect to={item.url}>{item.text}</LiveRedirect>
          {/if}
    
          {#if @link_type == "live_patch" && !is_nil(item[:url])}
          <LivePatch to={item.url}>{item.text}</LivePatch>
          {/if}
    
          {#if is_nil(item[:url])}
          {item.text}
          {/if}
    
          </li>
        {/for}
      </ol>
    </nav>
    """
  end

  def render(assigns) do
    ~F"""
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        {#for item <- @items}
          <li class={["breadcrumb-item", active: item.active]}>
          {#if @link_type == "link" && !is_nil(item.url)}
          <Link to={item.url}>{item.text}</Link>
          {/if}
    
          {#if @link_type == "live_redirect" && !is_nil(item.url)}
          <LiveRedirect to={item.url}>{item.text}</LiveRedirect>
          {/if}
    
          {#if @link_type == "live_patch" && !is_nil(item.url)}
          <LivePatch to={item.url}>{item.text}</LivePatch>
          {/if}
    
          {#if is_nil(item.url)}
          {item.text}
          {/if}
    
          </li>
        {/for}
      </ol>
    </nav>
    """
  end
end
