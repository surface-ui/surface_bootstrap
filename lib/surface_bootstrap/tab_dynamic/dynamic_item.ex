defmodule SurfaceBootstrap.TabDynamic.Item do
  @moduledoc """
  Defines an Item for TabDynamic
  """
  use Surface.Component, slot: "dynamic_tab_items"

  prop label, :string, required: true
end
