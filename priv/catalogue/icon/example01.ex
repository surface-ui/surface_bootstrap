defmodule SurfaceBootstrap.Catalogue.Icon.Example01 do
  use Surface.Catalogue.Example,
    subject: SurfaceBootstrap.Icon,
    catalogue: SurfaceBootstrap.Catalogue,
    title: "Label",
    height: "110px",
    direction: "vertical"

  def render(assigns) do
    ~F"""
    <Icon icon="arrow-down-left-circle" color="primary" />
    <Icon icon="arrow-down-left-circle" color="success" rem_size="2.5"/>
    <Icon icon="arrow-down-left-circle" color="danger"  rem_size="5"/>
    """
  end
end
