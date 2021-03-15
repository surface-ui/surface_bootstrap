defmodule SurfaceBootstrap.Card do
  @moduledoc """
  Card component

  https://getbootstrap.com/docs/5.0/components/card/
  """
  use Surface.Component

  prop text_align, :string, values: ~w(left center right)

  slot default

  def render(assigns) do
    ~H"""
    <div class={{
      "card",
      "text-center": @text_align == "center",
      "text-end": @text_align == "end"

    }}>
      <slot />
    </div>
    """
  end
end
