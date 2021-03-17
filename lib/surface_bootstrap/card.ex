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

  prop text_align, :string, values: ~w(left center right)

  prop width, :string, values: ~w(25 50 75 100)

  slot card_header
  slot card_footer
  slot default

  def render(assigns) do
    ~H"""
    <div class={{
      "card",
      "text-center": @text_align == "center",
      "text-end": @text_align == "end",
      "w-#{@width}": @width
    }}>
      <div :if={{slot_assigned?(:card_header)}} class="card-header">
      <slot name="card_header"/>
      </div>
      <slot />

      <div :if={{slot_assigned?(:card_footer)}} class={{["card-footer"] ++ footer_class(@card_footer) }}>
      <slot name="card_footer"/>
      </div>
    </div>
    """
  end

  defp footer_class(footer) do
    IO.inspect(footer)

    case footer do
      [%{class: class}] ->
        class

      _ ->
        []
    end
  end
end
