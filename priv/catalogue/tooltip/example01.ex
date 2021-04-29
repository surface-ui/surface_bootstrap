defmodule SurfaceBootstrap.Catalogue.Tooltip.Example01 do
  use Surface.Catalogue.Example,
    subject: SurfaceBootstrap.Tooltip,
    catalogue: SurfaceBootstrap.Catalogue,
    title: "Tooltips",
    direction: "vertical",
    height: "700px"

  alias Surface.Components.Link
  alias SurfaceBootstrap.{Button, Container, Tooltip}

  def render(assigns) do
    ~H"""
    <Container class="mb-5">
      <Tooltip placement="top" delay="5000">
      <Button
      title="foo"
      color="primary">
      Left
      </Button>
      </Tooltip>
    </Container>

    """
  end
end
