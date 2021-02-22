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
      fade: true
    }

  alias SurfaceBootstrap.Modal.{Footer}
  alias SurfaceBootstrap.Button

  def render(assigns) do
    ~H"""
    <Modal :props={{ @props }}>
      This is a modal!
      <Footer>
        <Button color="success" click={{ "bootstrap-modal-manual-hide" }}>Close</Button>
      </Footer>
    </Modal>
    """
  end

  def handle_event("bootstrap-modal-manual-hide", _, socket = %{assigns: %{props: props}}) do
    IO.puts("""
    SENDING EVENT!!
    """)

    socket = push_event(socket, "bootstrap-modal-hide-#{"test"}", %{})

    {:noreply, socket}
  end

  def handle_event("bootstrap-modal-hide", params, socket = %{assigns: %{props: props}}) do
    # To allow fade rendering to finish
    if(props[:fade]) do
      Process.sleep(1000)
    end

    socket =
      if params["id"] == socket.assigns.props.id do
        assign(socket, :props, %{props | show: false})
      else
        socket
      end

    {:noreply, socket}
  end
end
