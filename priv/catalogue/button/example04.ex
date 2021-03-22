defmodule SurfaceBootstrap.Catalogue.Button.Example04 do
  use Surface.Catalogue.Example,
    subject: SurfaceBootstrap.Button,
    catalogue: SurfaceBootstrap.Catalogue,
    title: "Groups of Buttons",
    height: "500px"

  alias SurfaceBootstrap.{Container, ButtonGroup}

  def render(assigns) do
    ~H"""
    <Container>
      <ButtonGroup class="my-1">
        <Button color="success" aria_label="Aria label">Yes</Button>
        <Button color="secondary">Maybe</Button>
        <Button color="secondary">No</Button>
      </ButtonGroup>
      <ButtonGroup class="my-1">
        <Button color="secondary">Yes</Button>
        <Button color="info" label="Maybe" />
        <Button color="secondary">No</Button>
      </ButtonGroup>
      <ButtonGroup class="my-1">
        <Button color="secondary">Yes</Button>
        <Button color="secondary">Maybe</Button>
        <Button color="danger">No</Button>
      </ButtonGroup>
    </Container>
    """
  end
end
