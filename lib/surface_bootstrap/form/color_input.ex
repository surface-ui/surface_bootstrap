defmodule SurfaceBootstrap.Form.ColorInput do
  @moduledoc """
  A text input of type "color", as defined here:
  - https://hexdocs.pm/phoenix_html/Phoenix.HTML.Form.html#color_input/3
  - https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/color
  """

  use Surface.Component
  use SurfaceBootstrap.Form.InputBase

  alias Surface.Components.Form.{Field, ColorInput, Label}
  alias SurfaceBootstrap.Form.BootstrapErrorTag

  @doc """
  Floating label?
  https://getbootstrap.com/docs/5.0/forms/floating-labels/
  """
  prop floating_label, :boolean

  def render(assigns) do
    ~H"""
    <Field class={{ "mb-#{@spacing}": @spacing, "form-floating": @floating_label }} name={{ @field }}>
      <Label :if={{ @label && !@in_group && !@floating_label }} class="form-label">{{ @label }}</Label>
      <ColorInput
        class={{[
          "form-control",
          "form-control-color",
          form_size(@size),
          "is-invalid": has_change?(assigns) && has_error?(assigns),
          "is-valid": has_change?(assigns) && !has_error?(assigns),
          "form-control-plaintext": @static
        ] ++ @class}}
        field={{ @field }}
        value={{ @value }}
        opts={{[
          disabled: @disabled,
          readonly: @readonly
        ] ++ @opts}}
      />
      <Label :if={{ @label && !@in_group && @floating_label }} class="form-">{{ @label }}</Label>
      <BootstrapErrorTag has_error={{ has_error?(assigns) }} has_change={{ has_change?(assigns) }} />
    </Field>
    """
  end
end
