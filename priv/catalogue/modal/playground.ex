defmodule SurfaceBootstrap.Catalogue.Modal.Playground do
  use Surface.Catalogue.Playground,
    subject: SurfaceBootstrap.Modal,
    catalogue: SurfaceBootstrap.Catalogue,
    height: "500px"

  data props, :map,
    default: %{
      id: "test",
      show: true,
      header: "Modal title",
      show_close_button: true
    }

  alias SurfaceBootstrap.Modal.{Footer}
  alias SurfaceBootstrap.Button

  def render(assigns) do
    ~H"""
    <Modal :props={{ @props }}>
      This is a modal!
      <Footer>
        <Button color="success" click={{ "close_modal", target: "#test" }}>Close</Button>
      </Footer>
    </Modal>
    """
  end
end
