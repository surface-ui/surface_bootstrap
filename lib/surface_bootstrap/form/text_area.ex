defmodule SurfaceBootstrap.Form.TextArea do
  @moduledoc """
  The text area component as defined here: https://getbootstrap.com/docs/5.0/forms/form-control/
  """

  use Surface.Component
  use SurfaceBootstrap.Form.TextInputBase

  alias Surface.Components.Form.TextArea

  @doc "Max length of field, as enforced by client browser. Not validated by Elixir."
  prop maxlength, :integer

  @doc "Minimum length of field, as enforced by client browser. Not validated by Elixir."
  prop minlength, :integer
  @doc "Height in pixels, defaults to 100"
  prop height, :string, default: "100"
  @doc "Rows attribute on textarea, please use height prop instead"
  prop rows, :integer

  def render(assigns) do
    ~H"""
    <FieldContext name={{ @field }}>
      {{ raw(optional_div(assigns)) }}
      <Label :if={{ @label && !@in_group && !@floating_label }} class="form-label">{{ @label }}</Label>
      <TextArea
        class={{ input_classes(assigns) ++ @class }}
        field={{ @field }}
        value={{ @value }}
        :props={{ default_surface_input_props(assigns) }}
        opts={{ height_style(@height) ++ default_core_input_opts(assigns) ++ @opts }}
      />
      <Label :if={{ @label && !@in_group && @floating_label }} class="form-label">{{ @label }}</Label>
      <BootstrapErrorTag has_error={{ has_error?(assigns) }} has_change={{ has_change?(assigns) }} />
      {{ help_text(assigns) }}
      <#Raw :if={{ !@in_group }}></div></#Raw>
    </FieldContext>
    """
  end

  defp height_style(height) do
    if height do
      [style: "height: #{height}px"]
    else
      []
    end
  end
end
