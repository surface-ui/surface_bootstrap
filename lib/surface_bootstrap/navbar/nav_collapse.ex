defmodule SurfaceBootstrap.Nav.Collapse do
  @moduledoc """
  Collapsible wrapper
  """
  use Surface.Component

  @doc "Id, required for collapsing to work"
  prop id, :string, required: true

  @doc """
  Should navbar be scrollable in collapsed state?
  See: https://getbootstrap.com/docs/5.0/components/navbar/?#scrolling
  """
  prop scrollable, :boolean

  @doc "Classes to propagate to the collapsing div."
  prop class, :css_class, default: []

  slot default

  def render(assigns) do
    ~H"""
    <button
    :hook="NavToggler"
    class="navbar-toggler"
    type="button"
    data-bs-toggle="collapse"
    data-bs-target={{@id}}
    aria-controls={{@id}}
    aria-expanded="false"
    aria-label={{@aria_label}}
    data-bsnclass="collapsed">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div
    id={{@id}}
    class={{["collapse", "navbar-collapse"] ++ @class}}
    :attrs={{
      "data-bsnstyle": true,
      "data-bsnclass": "show"
    }}
    >

    </div>
    """
  end
end
