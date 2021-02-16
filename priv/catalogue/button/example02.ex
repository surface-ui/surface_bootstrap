defmodule SurfaceBootstrap.Catalogue.Button.Example02 do
  use Surface.Catalogue.Example,
    subject: SurfaceBootstrap.Button,
    catalogue: SurfaceBootstrap.Catalogue,
    title: "Colors & Sizes",
    direction: "vertical",
    height: "110px",
    container: {:div, class: "buttons"}

  def render(assigns) do
    ~H"""
    <Button>Default</Button>
    <Button size="small" color="info">Small</Button>
    <Button color="primary">Normal</Button>
    <Button size="large" color="danger">Large</Button>
    """
  end
end
