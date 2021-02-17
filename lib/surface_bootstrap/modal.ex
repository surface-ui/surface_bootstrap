defmodule SurfaceBootstrap.Modal do
  use Surface.LiveComponent
  alias SurfaceBootstrap.Button

  @moduledoc """
  The card **modal**, with various configuration options.
  The modal is a stateless component and as such requires outside
  handling of whether or not the modal should be shown.

  This component is currently not usable with javascript control of
  if component should be shown or not.
  """

  @doc "If modal should be shown on render or not, defaults to false"
  prop show, :boolean, default: false

  @doc "If modal should show close button at top right of card"
  prop show_close_button, :boolean, default: true

  @doc ""

  @doc "Should modal fade in/out? Defaults true"
  prop fade, :boolean, default: true

  @doc """
  Close modal event name, defaults to "close_modal".
  """
  prop close_modal_event, :string, default: "close_modal"

  @doc "Header text"
  prop header, :string

  @doc "Footer content, use via Modal.Footer"
  slot footer

  @doc "Default slot"
  slot default, required: true

  data is_shown, :boolean, default: false

  def update(assigns, socket) do
    socket =
      assign(socket, assigns)
      |> assign(:is_shown, assigns.show)

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div
      :on-capture-click={{@close_modal_event}}
      :on-window-keyup={{@close_modal_event}}
      id={{@id}}
      class={{
        "modal",
        fade: @fade,
        show: @is_shown,
        "d-block": @is_shown}}
        :attrs={{
          "aria-hidden": "#{!@is_shown}",
          "aria-modal": "#{@is_shown}"
        }}
        tabindex="-1">
    <div class="modal-dialog">
      <div class="modal-content">
        <div :if={{@header}} class="modal-header">
          <h5 class="modal-title">{{@header}}</h5>
          <Button :if={{@show_close_button}} class="btn-close" aria_label="Close" click={{@close_modal_event}}/>
        </div>
        <div class="modal-body">
          <slot/>
        </div>
        <div :if={{slot_assigned?(:footer)}} class="modal-footer">
          <slot name="footer"/>
        </div>
      </div>
    </div>
    </div>
    <div
      :if={{@is_shown}}
      class={{"modal-backdrop",  "fade",  show: @is_shown}}></div>
    """
  end

  def handle_event(event, params, socket = %{assigns: %{close_modal_event: close_event}}) do
    socket =
      cond do
        event == close_event && Map.get(params, "key") == "Escape" ->
          assign(socket, :is_shown, false)

        event == socket.assigns.close_modal_event && Map.get(params, "key") == nil ->
          assign(socket, :is_shown, false)

        true ->
          socket
      end

    {:noreply, socket}
  end
end
