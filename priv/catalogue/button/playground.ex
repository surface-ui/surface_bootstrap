defmodule SurfaceBootstrap.Catalogue.Button.Playground do
  use Surface.Catalogue.Playground,
    subject: SurfaceBootstrap.Button,
    catalogue: SurfaceBootstrap.Catalogue,
    height: "110px",
    container: {:div, class: "buttons is-centered"}

  data props, :map,
    default: %{
      label: "My Button",
      color: "success"
    }

  def render(assigns) do
    ~F"""
    <Button :props={@props} />
    """
  end
end
