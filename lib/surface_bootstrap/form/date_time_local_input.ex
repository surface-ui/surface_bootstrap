defmodule SurfaceBootstrap.Form.DateTimeLocalInput do
  @moduledoc """
  The local datetime input element as defined here:
  - https://hexdocs.pm/phoenix_html/Phoenix.HTML.Form.html#datetime_local_input/3
  - https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/datetime-local
  """

  use Surface.Component
  use SurfaceBootstrap.Form.InputBase

  alias Surface.Components.Form.{Field, DateTimeLocalInput, Label}

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
      <DateTimeLocalInput
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
