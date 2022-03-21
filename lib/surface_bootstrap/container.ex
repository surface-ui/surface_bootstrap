defmodule SurfaceBootstrap.Container do
  @moduledoc """
  A container class, lets you set breakpoints to adjust to mobile views etc.

  https://getbootstrap.com/docs/5.0/layout/containers/
  """
  use Surface.Component
  use SurfaceBootstrap.AriaBase

  @doc "Css classes to propagate down to button group."
  prop class, :css_class, default: []

  @doc """
  Container breakpoint, look at documentation from moduledoc for explanations.
  Unknown value or no value set defaults to 'normal' which translates to no
  breakpoint modifier (plain class "container").
  """
  prop breakpoint, :string, values: ~w(normal small medium large xl xxl fluid)

  slot default

  def render(assigns) do
    ~F"""
    <div class={[get_class(@breakpoint)] ++ @class} {...set_aria_base_attrs(assigns)}>
      <#slot />
    </div>
    """
  end

  defp get_class(breakpoint) do
    case breakpoint do
      "small" ->
        "container-sm"

      "medium" ->
        "container-md"

      "large" ->
        "container-lg"

      "xl" ->
        "container-xl"

      "xll" ->
        "container-xxl"

      "fluid" ->
        "container-fluid"

      _ ->
        "container"
    end
  end
end
