defmodule SurfaceBootstrap.Catalogue.Tooltip.Example01 do
  use Surface.Catalogue.Example,
    subject: SurfaceBootstrap.Tooltip,
    catalogue: SurfaceBootstrap.Catalogue,
    title: "Tooltips",
    direction: "vertical",
    height: "550px"

  alias SurfaceBootstrap.{Container, Tooltip}

  def render(assigns) do
    ~H"""
    <Container class="mb-5 mt-5">
    <a id="some-id" :hook={{ "Hook", from: SurfaceBootstrap.Tooltip }} href="#" data-bs-placement="bottom" data-bs-toggle="tooltip" title="Some tooltip text!">Hover over me, I am using the hook</a>
    </Container>
    <Container class="mb-5">
      <Tooltip>
        <a href="#" data-bs-placement="bottom" data-bs-toggle="tooltip" title="Some tooltip text!">Hover over me, I am using the wrapper! </a>
        <br/>
        <a href="#" data-bs-placement="bottom" data-bs-toggle="tooltip" title="Some tooltip text!">Hover over me, I am using the wrapper! </a>
        <br/>
        <a href="#" data-bs-placement="bottom" data-bs-toggle="tooltip" title="Some tooltip text!">Hover over me, I am using the wrapper! </a>
      </Tooltip>
    </Container>

    <Container class="mb-5">
      <Tooltip>
      <button type="button" class="btn btn-secondary" data-bs-toggle="tooltip" data-bs-placement="top" title="Tooltip on top">
      Tooltip on top
    </button>
    <button type="button" class="btn btn-secondary" data-bs-toggle="tooltip" data-bs-placement="right" title="Tooltip on right">
      Tooltip on right
    </button>
    <button type="button" class="btn btn-secondary" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Tooltip on bottom">
      Tooltip on bottom
    </button>
    <button type="button" class="btn btn-secondary" data-bs-toggle="tooltip" data-bs-placement="left" title="Tooltip on left">
      Tooltip on left
    </button>
    <button type="button" class="btn btn-secondary" data-bs-delay="5000" data-bs-toggle="tooltip" data-bs-html="true" title="<em>Tooltip</em> <u>with</u> <b>HTML</b>">
    Tooltip with HTML
    </button>
      </Tooltip>
    </Container>
    """
  end
end
