defmodule SurfaceBootstrap.Catalogue.Card.Example05 do
  use Surface.Catalogue.Example,
    subject: SurfaceBootstrap.Card,
    catalogue: SurfaceBootstrap.Catalogue,
    title: "Image with overlay text",
    height: "400px",
    direction: "vertical"

  alias SurfaceBootstrap.{Card, Container}

  def render(assigns) do
    ~H"""
    <Container class="mb-5">
      <Card text_color="white" background_color="primary">
        {{raw(placeholder_svg())}}
        <Card.ImageOverlay>
          <Card.Body.Title title="Card title" />
          <Card.Body.Text>
            This is a wider card with supporting text below as a natural lead-in to
            additional content. This content is a little bit longer.
          </Card.Body.Text>
          <Card.Body.Text>
            Last updated 3 mins ago
          </Card.Body.Text>
        </Card.ImageOverlay>
      </Card>
    </Container>
    """
  end

  defp placeholder_svg() do
    ~s(<svg
    class="bd-placeholder-img bd-placeholder-img-lg card-img"
    width="100%"
    height="270"
    xmlns="http://www.w3.org/2000/svg"
    role="img"
    aria-label="Placeholder: Card image"
    preserveAspectRatio="xMidYMid slice"
    focusable="false"
    style="font-size: 3.5rem; text-anchor: middle;"
  ><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96" /><text x="50%" y="50%" fill="#dee2e6" dy=".3em">Card image</text></svg>)
  end
end
