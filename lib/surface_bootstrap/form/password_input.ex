defmodule SurfaceBootstrap.Form.PasswordInput do
  @moduledoc """
  The password field component as defined here:
  - https://bulma.io/documentation/form/input/
  - https://hexdocs.pm/phoenix_html/Phoenix.HTML.Form.html#password_input/3
  - https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/password
  """

  use Surface.Component
  use SurfaceBootstrap.Form.TextInputBase

  alias Surface.Components.Form.{Field, PasswordInput, Label}

  @doc "Max length of field, as enforced by client browser. Not validated by Elixir."
  prop maxlength, :integer

  @doc "Minimum length of field, as enforced by client browser. Not validated by Elixir."
  prop minlength, :integer

  def render(assigns) do
    ~H"""
    <Field class={{ "mb-#{@spacing}": @spacing, "form-floating": @floating_label }} name={{ @field }}>
      <Label :if={{ @label && !@in_group && !@floating_label }} class="form-label">{{ @label }}</Label>
      <PasswordInput
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
          maxlength: @maxlength,
          minlength: @minlength
        ] ++ @opts}}
      />
      <Label :if={{ @label && !@in_group && @floating_label }} class="form-label">{{ @label }}</Label>
      <BootstrapErrorTag has_error={{ has_error?(assigns) }} has_change={{ has_change?(assigns) }} />
    </Field>
    """
  end
end
