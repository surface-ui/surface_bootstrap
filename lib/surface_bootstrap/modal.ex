defmodule SurfaceBootstrap.Modal do
  use Surface.LiveComponent
  alias SurfaceBootstrap.Button
  alias Surface.Components.Raw

  @moduledoc """
  The Bootstrap **modal**, with various configuration options.


  This component relies on Bootstrap Native and requires to follow the instructions in the Readme file to use.

  Use the public API to show / hide the modal programmatically.
  The hook takes care of interop with classes that the javascript code modify to show/hide the modal.
  Using `Modal.show("component_id")` or `Modal.hide("component_id")` essentially delegates down
  to the javascript implementation to allow for animation, scroll overflow handling on the `<body>` element etc.
  ```
  """

  @doc "Should modal fade in/out? Defaults true"
  prop fade, :boolean, default: true

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

  data action, :atom

  def update(assigns, socket) do
    socket = assign(socket, assigns)

    socket =
      case assigns[:action] do
        nil ->
          socket

        :show ->
          push_event(socket, "bsn-show-modal-#{assigns.id}", %{})

        :hide ->
          push_event(socket, "bsn-hide-modal-#{assigns.id}", %{})
      end
      |> assign(:action, nil)

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div
      :hook="Modal"
      id={{ @id }}
      class={{
        "modal",
        fade: @fade
      }}
      :attrs={{
        "data-bsnstyle": true,
        "data-bsnclass": "show",
        "data-backdrop": backdrop_attribute(@backdrop, @static_backdrop)
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
            <Button click="close_modal" class="btn-close" aria_label="Close" />
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

  # External API

  def show(id) do
    send_update(__MODULE__, id: id, action: :show)
  end

  def hide(id) do
    send_update(__MODULE__, id: id, action: :hide)
  end

  def handle_event("close_modal", _params, socket) do
    hide(socket.assigns.id)
    {:noreply, socket}
  end
end
