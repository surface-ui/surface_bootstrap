defmodule SurfaceBootstrap.Catalogue.Card.Example03 do
  use Surface.Catalogue.Example,
    subject: SurfaceBootstrap.Card,
    catalogue: SurfaceBootstrap.Catalogue,
    title: "Headers and footers",
    height: "500px",
    direction: "vertical"

  # code_perc: 90

  alias Surface.Components.Link
  alias SurfaceBootstrap.{Card, Container}

  def render(assigns) do
    ~F"""
    <Container class="mb-5">
      <Card>
        <Card.Header>
          Featured
        </Card.Header>
        <Card.Body>
          <Card.Body.Title title="Special title treatment" />
          <Card.Body.Text>
            With supporting text below as a natural lead-in to additional content.
          </Card.Body.Text>
          <Link to="#" class="btn btn-primary">Go somewhere</Link>
        </Card.Body>
      </Card>
    </Container>
    <Container class="mb-5">
      <Card text_align="center">
        <Card.Header>
          Featured
        </Card.Header>
        <Card.Body>
          <Card.Body.Title title="Special title treatment" />
          <Card.Body.Text>
            With supporting text below as a natural lead-in to additional content.
          </Card.Body.Text>
          <Link to="#" class="btn btn-primary">Go somewhere</Link>
        </Card.Body>
        <Card.Footer class="text-muted">
          2 days ago
        </Card.Footer>
      </Card>
    </Container>
    """
  end
end
