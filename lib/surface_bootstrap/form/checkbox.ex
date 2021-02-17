defmodule SurfaceBootstrap.Form.Checkbox do
  @moduledoc """
  The checkbox component
  """

  use Surface.Component

  alias Surface.Components.Form.{Field, Checkbox, Label}

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

  @doc "The text / label of the checkbox"
  slot default

  def render(assigns) do
    ~H"""
      <Field class={{"field", form_check_class(@inline), "form-switch": @switch }} name={{@field}}>
        <Label :if={{!@checkbox_right}} class="checkbox"><slot/></Label>
        <Checkbox
          field={{@field}}
          opts={{ [disabled: @disabled] ++ @opts  }}
          class={{@class}}
          />
        <Label :if={{@checkbox_right}} class="checkbox"><slot/></Label>
      </Field>
    """
  end

  defp form_check_class(inline) do
    if inline do
      "form-check-inline"
    else
      "form-check"
    end
  end
end
