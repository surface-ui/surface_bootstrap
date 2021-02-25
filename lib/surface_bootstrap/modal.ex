defmodule SurfaceBootstrap.Modal do
  use Surface.LiveComponent
  alias SurfaceBootstrap.Button
  alias Surface.Components.Raw

  @moduledoc """
  The Bootstrap **modal**, with various configuration options.


  This component relies on Bootstrap Native and requires your liveview to implement at least
  one event to function properly.

  The first one is the inbound event to synchronize the hiding state with the server and
  will be instigated by
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

  You HAVE to handle this yourself in the parent liveview as there is currently no way
  to send events from a hook directly to a LiveComponent / Surface Component.

  If you want to close a modal using a button or other signaling from serverside
  you need to let the modal close itself by sending it an event to do so.
  On each mounted() event of a modal a hook registers an event listener for the event
  `"bootstrap-modal-hide-${this.el.id}"`. Also known as what you put in the `id={{}}` field
  on the modal.

  This means that you can iniate a modal close event
  simply by sending an event down to the hook.

  Combining a Button and a handle event could look like:
  ```
  <Button color="success" click={{ "bootstrap-modal-manual-hide" }}>Close</Button>
  ```
  with the handler looking like this:
  ```
  def handle_event("bootstrap-modal-manual-hide", _, socket}) do
                                                      #test = the id of the modal we're closing
    socket = push_event(socket, "bootstrap-modal-hide-test", %{})
    {:noreply, socket}
  end
  ```
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

  @doc "Scrollable content?"
  prop scrollable, :boolean

  @doc "Use grid? If true will replace modal-content class with container-fluid and let you use row and col classes to align content"
  prop use_grid, :boolean

  @doc "Center vertically?"
  prop vertically_centered, :boolean

  @doc "Header text"
  prop header, :string

  @doc "Footer content, use via Modal.Footer"
  slot footer

  @doc "Default slot"
  slot default, required: true

  def render(assigns) do
    ~H"""
    <div
      :hook="Modal"
      id={{ @id }}
      class={{
        "modal",
        fade: @fade,
        show: @show
      }}
      :attrs={{
        "aria-hidden": "#{!@show}",
        "aria-modal": "#{@show}",
        "data-backdrop": backdrop_attribute(@backdrop, @static_backdrop),
        "data-show": @show
      }}
      tabindex="-1"
    >
      <div class={{
        "modal-dialog",
        "modal-dialog-scrollable": @scrollable,
        "modal-dialog-centered": @vertically_centered
      }}>
        <div class="modal-content">
          <div :if={{ @header }} class="modal-header">
            <h5 class="modal-title">{{ @header }}</h5>
            <Button class="btn-close" aria_label="Close" />
          </div>
          <div class="modal-body">
            <#Raw :if={{ @use_grid }}>
            <div class="container-fluid">
            </#Raw>
            <slot />
            <#Raw :if={{ @use_grid }}>
            </div>
            </#Raw>
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
