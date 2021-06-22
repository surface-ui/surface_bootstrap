defmodule SurfaceBootstrap.NavBar.Collapse do
  @moduledoc """
  Collapsible navbar
  """
  use Surface.Component

  alias SurfaceBootstrap.NavBar.Toggler

  @doc "Id, required for collapsing to work"
  prop id, :string, required: true

  @doc """
  Should navbar be scrollable in collapsed state?
  See: https://getbootstrap.com/docs/5.0/components/navbar/?#scrolling
  """
  prop scrollable, :boolean

  @doc "Classes to propagate to the collapsing div."
  prop class, :css_class, default: []

  @doc "Aria label for button"
  prop aria_label, :string

  slot default

  def render(assigns) do
    ~F"""
    <Toggler target_id={@id} />
    <div
      id={@id}
      class={["collapse", "navbar-collapse"] ++ @class}
      :attrs={
        "data-bsnstyle": true,
        "data-bsnclass": "show"
      }
    >
      <#slot />
    </div>
    """
  end
end
