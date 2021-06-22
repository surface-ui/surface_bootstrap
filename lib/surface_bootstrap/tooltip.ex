defmodule SurfaceBootstrap.Tooltip do
  @moduledoc """
  Tooltip component, is used to initialize a tooltip on a child
  <slot/>.

  Simply use as <Tooltip>... your content here..</Tooltip>.

  Initialize the tooltip as described in the link below
  using the data-bs props. This wrapper simply initializes
  the inner child using the Bootstrap Native code through a
  hook.

  https://getbootstrap.com/docs/5.0/components/tooltips/
  """
  use Surface.Component

  slot default

  def render(assigns) do
    ~F"""
    <span :hook="Tooltip" id={"tooltip-" <> Ecto.UUID.generate()}>
      <#slot />
    </span>
    """
  end
end
