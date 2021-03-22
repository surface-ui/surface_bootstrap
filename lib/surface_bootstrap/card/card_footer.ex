defmodule SurfaceBootstrap.Card.Footer do
  @moduledoc """
  Card footer slot

  https://getbootstrap.com/docs/5.0/components/card/#header-and-footer
  """
  use Surface.Component, slot: "card_footer"

  prop class, :css_class, default: []
end
