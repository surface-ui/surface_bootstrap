defmodule SurfaceBootstrap.Form.RangeInput do
  @moduledoc """
  Range input is currently not implemented in Bulma.
  Needs custom css to display properly. This is a TODO item.

  The range input element as defined here:
  - https://hexdocs.pm/phoenix_html/Phoenix.HTML.Form.html#range_input/3
  - https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/range
  """

  use Surface.Component
  use SurfaceBootstrap.Form.InputBase
  use SurfaceBootstrap.Form.InputAddonBase

  alias Surface.Components.Form.{Field, RangeInput, Label}

  @doc "Largest number allowed, as enforced by client browser. Not validated by Elixir."
  prop max, :integer

  @doc "Smallest number allowed, as enforced by client browser. Not validated by Elixir."
  prop min, :integer

  @doc "A stepping interval to use when using up and down arrows to adjust the value, as well as for validation"
  prop step, :integer

  def render(assigns) do
    ~H"""
    <Field
      class={{
        "field",
        "has-addons": slot_assigned?(:left_addon) || slot_assigned?(:right_addon),
        "is-expanded": @expanded
      }}
      name={{ @field }}
    >
      <Label
        :if={{ !(slot_assigned?(:left_addon) || slot_assigned?(:right_addon)) && @label }}
        class="label"
      >{{ @label }}</Label>
      <div :if={{ slot_assigned?(:left_addon) }} class="control">
        <slot name="left_addon" />
      </div>
      <div class={{
        "control",
        "is-expanded": @expanded
      }}>
        <RangeInput
          class={{[
            "input",
            "slider",
            "is-danger": has_error?(assigns),
            "is-success": has_change?(assigns) && !has_error?(assigns),
            "is-static": @static
          ] ++ @class}}
          field={{ @field }}
          opts={{[
            disabled: @disabled,
            readonly: @readonly,
            max: @max,
            min: @min
          ] ++ @opts}}
        />
      </div>
      <div :if={{ slot_assigned?(:right_addon) }} class="control">
        <slot name="right_addon" />
      </div>
      <span :if={{ @help_text && !has_error?(assigns) }} class="help">{{ @help_text }}</span>
    </Field>
    """
  end
end
