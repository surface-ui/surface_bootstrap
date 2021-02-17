defmodule SurfaceBootstrap.Form.Checkbox do
  @moduledoc """
  The checkbox component
  """

  use Surface.Component

  import Phoenix.HTML.Form, only: [input_id: 2]
  alias Surface.Components.Form.{Field, Checkbox}

  @doc "The the field on the changeset"
  prop field, :atom, required: true

  @doc "Disable selection"
  prop disabled, :boolean, default: false

  @doc "Any opts you want to pass on to internal `Surface.Checkbox` and `Phoenix.HTML.Form.checkbox/3`"
  prop opts, :keyword, default: []

  @doc "Class to apply to input"
  prop class, :css_class, default: []

  @doc "Move checkbox to right hand side"
  prop checkbox_right, :boolean

  @doc "Show checkbox in switch style"
  prop switch, :boolean

  @doc "Show checkbox inline"
  prop inline, :boolean

  @doc "Label if simple text, will be overwritten by slot content for complex checkboxes"
  prop label, :string

  @doc "The text / label of the checkbox"
  slot default

  def render(assigns) do
    ~H"""
    <Field
      class={{
        "form-check",
        "form-check-inline": @inline,
        "form-switch": @switch
      }}
      name={{ @field }}
    >
      <Context get={{ Surface.Components.Form, form: form }}>
        <label for={{ input_id(form, @field) }} :if={{ @checkbox_right }} class="form-check-label"><slot>{{ @label }}</slot></label>
        <Checkbox
          field={{ @field }}
          opts={{ [disabled: @disabled] ++ @opts }}
          class={{ ["form-check-input"] ++ @class }}
        />
        <label for={{ input_id(form, @field) }} :if={{ !@checkbox_right }} class="form-check-label"><slot>{{ @label }}</slot></label>
      </Context>
    </Field>
    """
  end
end
