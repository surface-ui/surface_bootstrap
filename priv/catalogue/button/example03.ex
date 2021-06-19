defmodule SurfaceBootstrap.Catalogue.Button.Example03 do
  use Surface.Catalogue.Example,
    subject: SurfaceBootstrap.Button,
    catalogue: SurfaceBootstrap.Catalogue,
    title: "Outlined, Rounded and Loading",
    height: "100px",
    direction: "vertical",
    container: {:div, class: "buttons"}

  def render(assigns) do
    ~F"""
    <Button color="info" outlined rounded>Outlined</Button>
    <Button color="primary" rounded>Rounded</Button>
    <Button color="danger" loading label="Loading" />
    <Button color="danger" loading loading_text="Tmp text">Loading</Button>
    """
  end
end
