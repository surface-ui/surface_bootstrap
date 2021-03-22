defmodule SurfaceBootstrap.Form.DateTimeLocalInput do
  @moduledoc """
  The local datetime input element as defined here:
  - https://hexdocs.pm/phoenix_html/Phoenix.HTML.Form.html#datetime_local_input/3
  - https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/datetime-local
  """

  use Surface.Component
  use SurfaceBootstrap.Form.InputBase

  alias Surface.Components.Form.DateTimeLocalInput

  @doc "Largest date allowed, as enforced by client browser. Not validated by Elixir."
  prop max, :string

  @doc "Earliest date allowed, as enforced by client browser. Not validated by Elixir."
  prop min, :string

  @doc """
  Floating label?
  https://getbootstrap.com/docs/5.0/forms/floating-labels/
  """
  prop floating_label, :boolean

  def render(assigns) do
    ~H"""
    <FieldContext name={{ @field }}>
      {{ raw(optional_div(assigns)) }}
      <Label :if={{ @label && !@in_group }} class="form-label">{{ @label }}</Label>
      <DateTimeLocalInput
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
