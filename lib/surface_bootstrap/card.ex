defmodule SurfaceBootstrap.Card do
  @moduledoc """
  Card component.

  Can hold:
  - Card.Body
    - Card.Body.Title (inside Body)
  - Card.Footer
  - List groups (https://getbootstrap.com/docs/5.0/components/list-group/)
  - `<a class="card-link">` (Link, LiveRedirect, LivePatch)
  - `<img class="card-img-top">` and `<img class="card-img-bottom">`

  https://getbootstrap.com/docs/5.0/components/card/
  """
  use Surface.Component

  @colors ~w(primary secondary success danger warning info light dark)

  @text_colors ~w(primary secondary success danger warning info light dark body muted white black-50  white-50)

  @doc "Which way to align text, will cascade to all child elements"
  prop text_align, :string, values: ~w(left center right)

  @doc "Helper to set utility classes of width in % of parent container"
  prop width, :string, values: ~w(25 50 75 100)

  @doc "Can be used to set width like `width: 18em`"
  prop style, :string

  @doc "Background color"
  prop background_color, :string, values: @colors

  @doc "Text color"
  prop text_color, :string, values: @text_colors

  @doc "Border color"
  prop border_color, :string, values: @colors

  slot card_header
  slot card_footer
  slot default

  def render(assigns) do
    ~H"""
    <div
      class={{
        "card",
        "text-center": @text_align == "center",
        "text-end": @text_align == "end",
        "w-#{@width}": @width,
        "text-#{@text_color}": @text_color,
        "bg-#{@background_color}": @background_color,
        "border-#{@border_color}": @border_color
      }}
      :attrs={{
        style: @style
      }}
    >
      <div :if={{ slot_assigned?(:card_header) }} class="card-header">
        <slot name="card_header" />
      </div>
      <slot />

      <div
        :if={{ slot_assigned?(:card_footer) }}
        class={{ ["card-footer"] ++ footer_class(@card_footer) }}
      >
        <slot name="card_footer" />
      </div>
    </div>
    """
  end

  defp footer_class(footer) do
    case footer do
      [%{class: class}] ->
        class

      _ ->
        []
    end
  end
end
