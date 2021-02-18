defmodule SurfaceBootstrap.Form.RangeInput do
  @moduledoc """
  The range input element as defined here:
  - https://hexdocs.pm/phoenix_html/Phoenix.HTML.Form.html#range_input/3
  - https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/range
  """

  use Surface.Component
  use SurfaceBootstrap.Form.TextInputBase

  alias Surface.Components.Form.{Field, RangeInput, Label}
  alias Surface.Components.Form.Input.InputContext
  @doc "Largest number allowed, as enforced by client browser. Not validated by Elixir."
  prop max, :integer

  @doc "Smallest number allowed, as enforced by client browser. Not validated by Elixir."
  prop min, :integer

  @doc "A stepping interval to use when using up and down arrows to adjust the value, as well as for validation"
  prop step, :integer

  @doc "Show attached range value"
  prop show_value, :string, values: ~w(left right)

  def render(assigns) do
    # in_group = assigns.in_group || assigns.__
    # IO.inspect(assigns.__context__[{Surface.Components.Form, :form}], pretty: true)
    # IO.inspect(assigns.__context__[{Surface.Components.Form, :form}].source.data, pretty: true)

    ~H"""
    <If condition={{ @show_value }}>
    <Label :if={{ @label }} class="form-label">{{ @label }}</Label>
    </If>
    <Field
      class={{ "input-group": @show_value, "mb-#{@spacing}": @spacing, "form-floating": @floating_label }}
      name={{ @field }}
    >
      <Label :if={{ @label && !@in_group && !@show_value }} class="form-label">{{ @label }}</Label>
      <If condition={{ @show_value == "left" }}>
        <InputContext assigns={{ assigns }} :let={{ form: form, field: field }}>
          <span class="input-group-text">{{ Ecto.Changeset.get_field(form.source, field) }}</span>
        </InputContext>
      </If>
      <RangeInput
        class={{[
          "form-control",
          form_size(@size),
          "is-invalid": has_change?(assigns) && has_error?(assigns),
          "is-valid": has_change?(assigns) && !has_error?(assigns),
          "form-control-plaintext": @static
        ] ++ @class}}
        field={{ @field }}
        value={{ @value }}
        opts={{[
          placeholder: @placeholder,
          disabled: @disabled,
          readonly: @readonly,
          max: @max,
          min: @min,
          step: @step
        ] ++ @opts}}
      />
      <If condition={{ @show_value == "right" }}>
        <InputContext assigns={{ assigns }} :let={{ form: form, field: field }}>
          <span class="input-group-text">{{ Ecto.Changeset.get_field(form.source, field) }}</span>
        </InputContext>
      </If>
      <BootstrapErrorTag has_error={{ has_error?(assigns) }} has_change={{ has_change?(assigns) }} />
    </Field>
    """
  end
end
