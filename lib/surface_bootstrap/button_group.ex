defmodule SurfaceBootstrap.ButtonGroup do
  @moduledoc """
  Group of buttons.
  
  Can contain
  - Button components
  - Link Components
  - <input> of type checkbox and radio
  
  https://getbootstrap.com/docs/5.0/components/button-group/
  """
  use Surface.Component
  use SurfaceBootstrap.AriaBase

  @doc "Vertical button group"
  prop vertical, :boolean

  @doc "Css classes to propagate down to button group."
  prop class, :css_class, default: []

  slot default

  def render(assigns) do
    ~F"""
    <div
      class={[get_class(assigns)] ++ @class}
      {...set_aria_base_attrs(assigns)}
      role="group"
    >
      <#slot />
    </div>
    """
  end

  defp get_class(assigns) do
    case assigns do
      %{vertical: true} ->
        "btn-group-vertical"

      _ ->
        "btn-group"
    end
  end
end
