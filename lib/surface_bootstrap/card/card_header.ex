defmodule SurfaceBootstrap.Card.Header do
  @moduledoc """
  Card header slot

  https://getbootstrap.com/docs/5.0/components/card/#header-and-footer
  """
  use Surface.Component, slot: "card_header"

  prop class, :css_class, default: []
end
