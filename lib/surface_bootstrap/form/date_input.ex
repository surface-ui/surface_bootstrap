defmodule SurfaceBootstrap.Form.DateInput do
  @moduledoc """
  The date input element as defined here:
  - https://hexdocs.pm/phoenix_html/Phoenix.HTML.Form.html#date_input/3
  - https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/date
  """

  use Surface.Component
  use SurfaceBootstrap.Form.InputBase

  alias Surface.Components.Form.{Field, DateInput, Label}

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
    <Field class={{ "mb-#{@spacing}": @spacing, "form-floating": @floating_label }} name={{ @field }}>
      <Label :if={{ @label && !@in_group }} class="form-label">{{ @label }}</Label>
      <DateInput
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
          disabled: @disabled,
          readonly: @readonly,
          max: @max,
          min: @min
        ] ++ @opts}}
      />
      <BootstrapErrorTag has_error={{ has_error?(assigns) }} has_change={{ has_change?(assigns) }} />
    </Field>
    """
  end
end
