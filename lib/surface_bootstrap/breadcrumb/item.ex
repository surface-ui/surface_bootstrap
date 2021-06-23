defmodule SurfaceBootstrap.Breadcrumb.Item do
  use Surface.Component, slot: "items"

  @moduledoc """
  Renderless holder of Breadcrumb.Item data.
  """

  @doc "Breadcrumb text"
  prop text, :string, required: true

  @doc "Url to render, optional and should not be supplied on last item to grey out"
  prop url, :string

  @doc "Is this item the active one?"
  prop active, :boolean, default: false
end
