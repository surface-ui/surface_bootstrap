defmodule SurfaceBootstrap.Form.RangeInput do
  @moduledoc """
  The range input element as defined here:
  - https://hexdocs.pm/phoenix_html/Phoenix.HTML.Form.html#range_input/3
  - https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/range
  """

  use Surface.Component
  use SurfaceBootstrap.Form.InputBase

  alias Surface.Components.Form.RangeInput
  alias Surface.Components.Form.Input.InputContext
  @doc "Largest number allowed, as enforced by client browser. Not validated by Elixir."
  prop max, :integer

  @doc "Smallest number allowed, as enforced by client browser. Not validated by Elixir."
  prop min, :integer

  @doc "A stepping interval to use when using up and down arrows to adjust the value, as well as for validation"
  prop step, :integer

  @doc "Show attached range value"
  prop show_value, :string, values: ~w(left right)

  @doc """
  Floating label?
  https://getbootstrap.com/docs/5.0/forms/floating-labels/
  """
  prop floating_label, :boolean

  def render(assigns) do
    ~H"""
    <FieldContext name={{ @field }}>
      <Label :if={{ @label && @show_value }} class="form-label">{{ @label }}</Label>
      {{ raw(optional_div(assigns)) }}
      <Label :if={{ @label && !@in_group && !@show_value }} class="form-label">{{ @label }}</Label>
      <If condition={{ @show_value == "left" }}>
        <InputContext assigns={{ assigns }} :let={{ form: form, field: field }}>
          <span class="input-group-text">{{ Ecto.Changeset.get_field(form.source, field) }}</span>
        </InputContext>
      </If>
      <RangeInput
        class={{ input_classes(assigns) ++ @class }}
        field={{ @field }}
        value={{ @value }}
        :props={{ default_surface_input_props(assigns) }}
        opts={{ default_core_input_opts(assigns) ++ @opts }}
      />
      <If condition={{ @show_value == "right" }}>
        <InputContext assigns={{ assigns }} :let={{ form: form, field: field }}>
          <span class="input-group-text">{{ Ecto.Changeset.get_field(form.source, field) }}</span>
        </InputContext>
      </If>
      <BootstrapErrorTag has_error={{ has_error?(assigns) }} has_change={{ has_change?(assigns) }} />
      {{ help_text(assigns) }}
      <#Raw :if={{ !@in_group }}></div></#Raw>
    </FieldContext>
    """
  end
end
