defmodule SurfaceBootstrap.Form.ColorInput do
  @moduledoc """
  A text input of type "color", as defined here:
  - https://hexdocs.pm/phoenix_html/Phoenix.HTML.Form.html#color_input/3
  - https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/color
  """

  use Surface.Component
  use SurfaceBootstrap.Form.InputBase

  alias Surface.Components.Form.ColorInput

  @doc """
  Floating label?
  https://getbootstrap.com/docs/5.0/forms/floating-labels/
  """
  prop floating_label, :boolean

  def render(assigns) do
    ~H"""
    <FieldContext name={{ @field }}>
      {{ raw(optional_div(assigns)) }}
      <Label :if={{ @label && !@in_group && !@floating_label }} class="form-label">{{ @label }}</Label>
      <ColorInput
        class={{ ["form-control-color"] ++ input_classes(assigns) ++ @class }}
        field={{ @field }}
        value={{ @value }}
        :props={{ default_surface_input_props(assigns) }}
        opts={{ default_core_input_opts(assigns) ++ @opts }}
      />
      <Label :if={{ @label && !@in_group && @floating_label }} class="form-">{{ @label }}</Label>
      <BootstrapErrorTag has_error={{ has_error?(assigns) }} has_change={{ has_change?(assigns) }} />
      {{ help_text(assigns) }}
      <#Raw :if={{ !@in_group }}></div></#Raw>
    </FieldContext>
    """
  end

  # {{help_text(assigns)}}
end
