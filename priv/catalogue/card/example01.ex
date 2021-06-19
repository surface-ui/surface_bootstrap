defmodule SurfaceBootstrap.Catalogue.Card.Example01 do
  use Surface.Catalogue.Example,
    subject: SurfaceBootstrap.Card,
    catalogue: SurfaceBootstrap.Catalogue,
    title: "Card with image",
    height: "400px",
    code_perc: 90

  alias SurfaceBootstrap.{Card, Container}

  def render(assigns) do
    ~F"""
    <Container class="mb-5">
      <Card>
        {raw(placeholder_svg())}
        <Card.Body>
          <Card.Body.Title title="Card title" />
          <Card.Body.Text>
            Some quick example text to build on the card title and
            make up the bulk of the card's content.
          </Card.Body.Text>
        </Card.Body>
      </Card>
    </Container>
    """
  end

  defp placeholder_svg() do
    ~s(<svg
    class="card-img-top"
    width="100%"
    height="180"
    xmlns="http://www.w3.org/2000/svg"
    role="img"
    aria-label="Placeholder: Image cap"
    preserveAspectRatio="xMidYMid slice"
    focusable="false"
    style="text-anchor: middle; font-size: 1.125rem;"
  ><title>Placeholder</title>
    <rect width="100%" height="100%" fill="#868e96" />
    <text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text>
  </svg>)
  end
end
