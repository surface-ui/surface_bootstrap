defmodule SurfaceBootstrap.Catalogue.Button.Example04 do
  use Surface.Catalogue.Example,
    subject: SurfaceBootstrap.Button,
    catalogue: SurfaceBootstrap.Catalogue,
    title: "Groups of Buttons",
    height: "200px"

  alias SurfaceBootstrap.ButtonGroup

  def render(assigns) do
    ~H"""
    <ButtonGroup>
      <Button color="success" selected>Yes</Button>
      <Button color="secondary">Maybe</Button>
      <Button color="secondary">No</Button>
    </ButtonGroup>
    <br/>
    <ButtonGroup>
      <Button color="secondary">Yes</Button>
      <Button color="info" selected>Maybe</Button>
      <Button color="secondary">No</Button>
    </ButtonGroup>
    <br/>
    <ButtonGroup>
      <Button color="secondary">Yes</Button>
      <Button color="secondary">Maybe</Button>
      <Button color="danger" selected>No</Button>
    </ButtonGroup>
    """
  end
end
