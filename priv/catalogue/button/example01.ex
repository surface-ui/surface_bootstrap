defmodule SurfaceBootstrap.Catalogue.Button.Example01 do
  use Surface.Catalogue.Example,
    subject: SurfaceBootstrap.Button,
    catalogue: SurfaceBootstrap.Catalogue,
    title: "Label and attrs",
    height: "90px",
    container: {:div, class: "buttons"}

  def render(assigns) do
    ~H"""
    <Button color="secondary" label="Label" />
    <Button color="secondary">Slot</Button>
    <Button color="secondary" attrs={{ %{"phx-value-value1": "asdf", "phx-value-value2": "asdf2"}}}>Value</Button>
    """
  end
end
