defmodule SurfaceBootstrap.NavBar.Toggler do
  use Surface.Component

  @doc "Target of collapser button"
  prop target_id, :string, required: true

  @doc "Aria label of toggler"
  prop aria_label, :string

  @doc "Any classes to put on the toggler"
  prop class, :css_class, default: []

  @doc "Custom styles to put on the button"
  prop style, :string

  def render(assigns) do
    ~H"""
    <button
      :hook="NavToggler"
      id={{ @target_id <> "-toggler-button" }}
      class={{ ["navbar-toggler"] ++ @class }}
      type="button"
      data-bs-toggle="collapse"
      href={{ "##{@target_id}" }}
      aria-controls={{ @target_id }}
      aria-expanded="false"
      aria-label={{ @aria_label }}
      data-bsnclass="collapsed"
      :attrs={{ style: @style }}
    >
      <span class="navbar-toggler-icon" />
    </button>
    """
  end
end
