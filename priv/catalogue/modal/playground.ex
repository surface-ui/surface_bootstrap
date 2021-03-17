defmodule SurfaceBootstrap.Catalogue.Modal.Playground do
  use Surface.Catalogue.Playground,
    subject: SurfaceBootstrap.Modal,
    catalogue: SurfaceBootstrap.Catalogue,
    height: "500px"

  data props, :map,
    default: %{
      id: "test",
      header: "Modal title",
      fade: true
    }

  alias SurfaceBootstrap.Modal.{Footer}
  alias SurfaceBootstrap.{Button, Container}

  def render(assigns) do
    ~H"""
    <Container>
      <Button click="show_test_modal">Show Modal</Button>
      <Modal :props={{ @props }}>
        This is a modal!
        <Footer>
          <Button color="success" click="hide_test_modal">Close</Button>
        </Footer>
      </Modal>
    </Container>
    """
  end

  def handle_event("show_test_modal", _, socket) do
    Modal.show("test")

    {:noreply, socket}
  end

  def handle_event("hide_test_modal", _, socket) do
    Modal.hide("test")

    {:noreply, socket}
  end
end
