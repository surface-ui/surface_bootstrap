defmodule SurfaceBootstrap.Catalogue.Button.Example01 do
  use Surface.Catalogue.Example,
    subject: SurfaceBootstrap.Button,
    catalogue: SurfaceBootstrap.Catalogue,
    title: "Label",
    height: "90px",
    container: {:div, class: "buttons"}

  def render(assigns) do
    ~F"""
    <Button color="secondary" label="Label" />
    <Button color="secondary">Slot</Button>
    """
  end
end
