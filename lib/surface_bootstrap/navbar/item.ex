defmodule SurfaceBootstrap.NavBar.Item do
  @moduledoc """
  Defines an Item for the NavBar.
  This component supports three categories of components
  - `<a class="nav-link">`
  - `<span class="navbar-text">`
  - `<form class="d-flex">`

  This means the slot content should be one of the following
  - `<a class="nav-link">`
  - `<Link class="nav-link">`
  - `<LiveRedirect class="nav-link">`
  - `<LivePatch class="nav-link">`
  - `<form class="d-flex">` (note the class, if not used the form components will stack)
  - `<span class="navbar-text">`

  For forms, see https://getbootstrap.com/docs/5.0/components/navbar/?#forms for more information
  """

  use Surface.Component, slot: "nav_items"

  @doc """
  Grouping of the item.
  The NavBar has three grouping slots
  - "left" aligns left
  - "middle" aligns to the middle
  - "right" aligns to the right
  """
  prop group, :string, default: "left", values: ~w(left middle right)
end
