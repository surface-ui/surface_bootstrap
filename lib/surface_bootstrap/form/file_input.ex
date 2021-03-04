defmodule SurfaceBootstrap.Form.FileInput do
  @moduledoc """
  The file input component as defined here:
  - https://hexdocs.pm/phoenix_html/Phoenix.HTML.Form.html#file_input/3
  - https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/password
  """

  use Surface.Component
  use SurfaceBootstrap.Form.InputBase

  alias Surface.Components.Form.FileInput

  def render(assigns) do
    ~H"""
    <FieldContext name={{ @field }}>
    {{ raw(optional_div(assigns)) }}
    <Label :if={{ @label && !@in_group }} class="form-label">{{ @label }}</Label>
    <FileInput
      class={{ input_classes(assigns) ++ @class }}
      field={{ @field }}
      value={{ @value }}
      :props={{ default_surface_input_props(assigns) }}
      opts={{ default_core_input_opts(assigns) ++ @opts }}
    />
    <BootstrapErrorTag has_error={{ has_error?(assigns) }} has_change={{ has_change?(assigns) }} />
    {{ help_text(assigns) }}
    <#Raw :if={{ !@in_group }}></div></#Raw>
    </FieldContext>
    """
  end
end
