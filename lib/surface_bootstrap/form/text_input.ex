defmodule SurfaceBootstrap.Form.TextInput do
  @moduledoc """
  The text field component as defined here: https://bulma.io/documentation/form/input/
  """

  use Surface.Component
  use SurfaceBootstrap.Form.TextInputBase
  alias Surface.Components.Raw
  alias Surface.Components.Form.TextInput

  @doc "Max length of field, as enforced by client browser. Not validated by Elixir."
  prop maxlength, :integer

  @doc "Minimum length of field, as enforced by client browser. Not validated by Elixir."
  prop minlength, :integer

  def render(assigns) do
    ~H"""
    <FieldContext name={{ @field }}>
      {{ raw(optional_div(assigns)) }}
      <Label :if={{ @label && !@in_group && !@floating_label }} class="form-label">{{ @label }}</Label>
      <TextInput
        class={{ input_classes(assigns) ++ @class }}
        field={{ @field }}
        value={{ @value }}
        :props={{ default_surface_input_props(assigns) }}
        opts={{ default_core_input_opts(assigns) ++ @opts }}
      />
      <Label :if={{ @label && !@in_group && @floating_label }} class="form-label">{{ @label }}</Label>
      <BootstrapErrorTag has_error={{ has_error?(assigns) }} has_change={{ has_change?(assigns) }} />
      {{ help_text(assigns) }}
      <#Raw :if={{ !@in_group }}></div></#Raw>
    </FieldContext>
    """
  end
end
