defmodule SurfaceBootstrap.Form.NumberInput do
  @moduledoc """
  The number input element as defined here:
  - https://hexdocs.pm/phoenix_html/Phoenix.HTML.Form.html#number_input/3
  - https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/number
  """

  use Surface.Component
  use SurfaceBootstrap.Form.TextInputBase

  alias Surface.Components.Form.{Field, NumberInput, Label}

  @doc "Largest number allowed, as enforced by client browser. Not validated by Elixir."
  prop max, :integer

  @doc "Smallest number allowed, as enforced by client browser. Not validated by Elixir."
  prop min, :integer

  @doc "A stepping interval to use when using up and down arrows to adjust the value, as well as for validation"
  prop step, :integer

  def render(assigns) do
    ~H"""
    <Field class={{ "mb-#{@spacing}": @spacing, "form-floating": @floating_label }} name={{ @field }}>
      <Label :if={{ @label && !@in_group && !@floating_label }} class="form-label">{{ @label }}</Label>
      <NumberInput
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
      <BootstrapErrorTag has_error={{ has_error?(assigns) }} has_change={{ has_change?(assigns) }} />
    </Field>
    """
  end
end
