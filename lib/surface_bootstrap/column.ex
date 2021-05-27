defmodule SurfaceBootstrap.Column do
  @moduledoc """
  Column utility component, emits a `<div>` wrapper for columns.


  https://getbootstrap.com/docs/5.0/layout/grid/
  """
  use Surface.Component

  @width_base_values ~w(1 2 3 4 5 6 7 8 9 10 11 12 auto)

  @doc "Css classes to propagate down to column div."
  prop class, :css_class, default: []

  @doc "Width for extra small viewports"
  prop width, :string, values: @width_base_values ++ ["base"]

  @doc "Width for small viewports"
  prop sm_width, :string, values: @width_base_values

  @doc "Width for medium viewports"
  prop md_width, :string, values: @width_base_values

  @doc "Width for large viewports"
  prop lg_width, :string, values: @width_base_values

  @doc "Width for extra large viewports"
  prop xl_width, :string, values: @width_base_values

  @doc "Width for extra extra large viewports"
  prop xxl_width, :string, values: @width_base_values

  slot default

  def render(assigns) do
    ~H"""
    <div class={{[
      col: @width == "base",
      "col-#{@width}": !is_nil(@width) && @width != "base",
      "col-sm-#{@sm_width}": !is_nil(@sm_width),
      "col-md-#{@md_width}": !is_nil(@md_width),
      "col-lg-#{@lg_width}": !is_nil(@lg_width),
      "col-xl-#{@xl_width}": !is_nil(@xl_width),
      "col-xxl-#{@xxl_width}": !is_nil(@xxl_width)
    ] ++ @class}}>
      <slot />
    </div>
    """
  end
end
