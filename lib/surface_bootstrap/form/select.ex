defmodule SurfaceBootstrap.Form.Select do
  @moduledoc """
  The select component as defined here:
  - https://getbootstrap.com/docs/5.0/forms/select/
  - https://hexdocs.pm/phoenix_html/Phoenix.HTML.Form.html#select/4
  - https://hexdocs.pm/phoenix_html/Phoenix.HTML.Form.html#multiple_select/4
  """

  use Surface.Component

  alias Surface.Components.Form.{Field, Label, MultipleSelect, Select}

  @doc "The the field on the changeset"
  prop field, :atom, required: true

  @doc "The string label of the field"
  prop label, :string

  @doc "Disable selection"
  prop disabled, :boolean, default: false

  @doc "Any opts you want to pass on to internal `Surface.Checkbox` and `Phoenix.HTML.Form.checkbox/3`"
  prop opts, :keyword, default: []

  @doc "Class to apply to input"
  prop class, :css_class, default: []

  @doc "The select options"
  prop options, :any, default: []

  @doc """
  The selected value.
  For multiple selects this has to be a list that matches the value options.
  """
  prop selected, :any

  @doc "The prompt (nothing selected yet) string, is ignored for multiple selects."
  prop prompt, :string

  @doc "Margin below form control, to create spacing. Defaults to 3"
  prop spacing, :string, default: "3", values: ~w(1 2 3 4 5)

  @doc "Size of the input, defaults to nil(normal)"
  prop size, :string, values: ~w(small large)

  @doc "Select size, how many options visible before scroll"
  prop select_size, :integer

  @doc "Multiple Select"
  prop multiple, :boolean

  @doc """
  Floating label?
  https://getbootstrap.com/docs/5.0/forms/floating-labels/
  """
  prop floating_label, :boolean

  @doc "Is input in group? Set to true to hide label if used in `InputGroup`, defaults to false"
  prop in_group, :boolean, default: false

  def render(assigns) do
    ~H"""
    <Field class={{ "mb-#{@spacing}": @spacing, "form-floating": @floating_label }} name={{ @field }}>
      <Label :if={{ @label && !@in_group && !@floating_label }} class="form-label">{{ @label }}</Label>
      <If condition={{ @multiple }}>
        <MultipleSelect
          field={{ @field }}
          opts={{ [size: @select_size, disabled: @disabled] ++ @opts }}
          class={{[
            "form-select",
            "form-select-sm": @size == "small",
            "form-select-lg": @size == "large"
          ] ++ @class}}
          options={{ @options }}
          selected={{ @selected }}
        />
      </If>
      <If condition={{ !@multiple }}>
        <Select
          field={{ @field }}
          opts={{ [size: @select_size, disabled: @disabled] ++ @opts }}
          class={{[
            "form-select",
            "form-select-sm": @size == "small",
            "form-select-lg": @size == "large"
          ] ++ @class}}
          options={{ @options }}
          selected={{ @selected }}
          prompt={{ @prompt }}
        />
      </If>
      <Label :if={{ @label && !@in_group && @floating_label }} class="form-label">{{ @label }}</Label>
    </Field>
    """
  end
end
