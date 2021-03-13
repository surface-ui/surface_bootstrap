defmodule SurfaceBootstrap.TabStatic.Item do
  @moduledoc """
  Defines an Item for TabStatic

  This component supports links with class "nav-link".
  - `<a class="nav-link">`

  This means the slot content should be one of the following
  - `<a class="nav-link">`
  - `<Link class="nav-link">`
  - `<LiveRedirect class="nav-link">`
  - `<LivePatch class="nav-link">`
  - `<span class="navbar-text">` (can only be used with the TabDynamic component and will be silently ignored in TabStatic)
  """

  use Surface.Component, slot: "static_tab_items"
end
