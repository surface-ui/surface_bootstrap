defmodule SurfaceBootstrap.Catalogue.Card.Example02 do
  use Surface.Catalogue.Example,
    subject: SurfaceBootstrap.Card,
    catalogue: SurfaceBootstrap.Catalogue,
    title: "Titles and links",
    height: "200px",
    code_perc: 70

  alias Surface.Components.Link
  alias SurfaceBootstrap.{Card, Container}

  def render(assigns) do
    ~H"""
    <Container class="mb-5">
      <Card>
        <Card.Body>
          <Card.Body.Title title="Card title" sub_title="Card subtitle" sub_title_class="text-muted" />
          <Card.Body.Text>
            Some quick example text to build on the card title and
            make up the bulk of the card's content.
          </Card.Body.Text>
          <Link to="#" class="card-link">Card link</Link>
          <Link to="#" class="card-link">Another link</Link>
        </Card.Body>
      </Card>
    </Container>
    """
  end
end
