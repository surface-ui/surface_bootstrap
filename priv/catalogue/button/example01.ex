defmodule SurfaceBootstrap.Catalogue.Button.Example01 do
  use Surface.Catalogue.Example,
    subject: SurfaceBootstrap.Button,
    catalogue: SurfaceBootstrap.Catalogue,
    title: "Label",
    height: "90px",
    direction: "vertical",
    container: {:div, class: "buttons"}

  def render(assigns) do
    ~F"""
    <Button color="secondary" label="Label" />
    <Button color="secondary">Slot</Button>
    <Button color="secondary" value="foo">Value1</Button>
    <Button color="secondary" values={foo: "bar", baz: "bim"}>Multi value</Button>
    """
  end
end
