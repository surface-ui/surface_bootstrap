defmodule SurfaceBootstrap.DropDown.Item do
  @moduledoc """
  Defines an Item for the Dropdown.
  This component supports the following slot content
  - `<a class="dropdown-item">`
  - `<hr class="dropdown-divider">`

  This means the slot content should be one of the following
  - `<a class="dropdown-item"">`
  - `<Link class="dropdown-item"">`
  - `<LiveRedirect class="dropdown-item"">`
  - `<LivePatch class="dropdown-item"">`
  - `<hr class="dropdown-divider">`
  """

  use Surface.Component, slot: "dropdown_items"
end
