defmodule SurfaceBootstrap.Modal do
  use Surface.LiveComponent
  alias SurfaceBootstrap.Button

  @moduledoc """
  The Bootstrap **modal**, with various configuration options.


  This component relies on Bootstrap Native and requires the following code in the
  containing liveview:
  ```
  def handle_event("bootstrap-modal-hide", params, socket) do
    # To allow fade rendering to finish, can be optionally wrapped in a if
    # around the variable you pass to fade={{@some_var}} on the modal. If @some_var == false
    if assigns.some_var do
      Process.sleep(1000)
    end

    # Change this assigns to match the ID of your modal (as in id={{@some_id}})
    socket =
      if params["id"] == socket.assigns.CHANGE_THIS_YOUR_MODAL_ID do
        assign(socket, :CHANGE_THIS_YOUR_MODAL_ID_SHOW_PROP, false) # this is the show={{@your_prop_thing}}
      else
        socket
      end

    {:noreply, socket}
  end
  ```

  Opening a modal will close any other open modal and it will propagate a close
  event to the liveview for that modal. You need to update the show prop accordingly

  You need to handle this yourself in the parent liveview as there is currently no way
  to send events from a hook directly to a LiveComponent / Surface Component.
  """

  @doc "If modal should be shown on render or not, defaults to false"
  prop show, :boolean, default: false

  @doc "Should modal fade in/out? Defaults true"
  prop fade, :boolean, default: true

  @doc """
  Close modal event name, defaults to "close_modal".
  """
  prop close_modal_event, :string, default: "close_modal"

  @doc "Have backdrop / darkened background? Defaults true"
  prop backdrop, :boolean, default: true

  @doc "Should have static backdrop? As in clicking background does not close modal."
  prop static_backdrop, :boolean

  @doc "Header text"
  prop header, :string

  @doc "Footer content, use via Modal.Footer"
  slot footer

  @doc "Default slot"
  slot default, required: true

  def render(assigns) do
    ~H"""
    <div
      :hook={{"Modal"}}
      id={{ @id }}
      class={{
        "modal",
        fade: @fade,
        show: @show
      }}
      :attrs={{
        "aria-hidden": "#{!@show}",
        "aria-modal": "#{@show}",
        "data-backdrop": (backdrop_attribute(@backdrop, @static_backdrop)),
        "data-show": @show
      }}
      tabindex="-1"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div :if={{ @header }} class="modal-header">
            <h5 class="modal-title">{{ @header }}</h5>
            <Button
              class="btn-close"
              aria_label="Close"
            />
          </div>
          <div class="modal-body">
            <slot />
          </div>
          <div :if={{ slot_assigned?(:footer) }} class="modal-footer">
            <slot name="footer" />
          </div>
        </div>
      </div>
    </div>
    """
  end

  defp backdrop_attribute(backdrop, static) do
    cond do
      !backdrop ->
        nil

      backdrop && static ->
        "static"

      backdrop ->
        true
    end
  end
end
