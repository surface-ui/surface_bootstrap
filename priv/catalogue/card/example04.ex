defmodule SurfaceBootstrap.Catalogue.Card.Example04 do
  use Surface.Catalogue.Example,
    subject: SurfaceBootstrap.Card,
    catalogue: SurfaceBootstrap.Catalogue,
    title: "Tabs",
    height: "250px",
    direction: "vertical"

  # code_perc: 90

  alias Surface.Components.Link
  alias SurfaceBootstrap.{Card, Container, Tab}

  def render(assigns) do
    ~F"""
    <Container class="mb-5">
      <Card>
        <Card.Header>
          <Tab>
            <Tab.Item>
              <Link to="#" class="nav-link active">
                Active
              </Link>
            </Tab.Item>
            <Tab.Item>
              <Link to="#" class="nav-link">
                Link
              </Link>
            </Tab.Item>
            <Tab.Item>
              <Link to="#" class="nav-link disabled">
                Disabled
              </Link>
            </Tab.Item>
          </Tab>
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
    """
  end
end
