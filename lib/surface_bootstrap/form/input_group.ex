defmodule SurfaceBootstrap.Form.InputGroup do
  @moduledoc """
  Input group

  https://getbootstrap.com/docs/5.0/forms/input-group/
  """
  use Surface.Component

  @doc "Margin below form group, to create spacing. Defaults to 3"
  prop spacing, :string, default: "3", values: ~w(1 2 3 4 5)

  @doc "Size of the input group, defaults to nil(normal)"
  prop size, :string, values: ~w(small large)

  @doc "Css classes to propagate down to input group."
  prop class, :css_class, default: []

  @doc "Label for input group"
  prop label, :string

  slot default, props: [:in_group]

  def render(assigns) do
    ~H"""
    <label :if={{ @label }} class="form-label">{{ @label }}</label>
    <div class={{
      "input-group",
      "mb-#{@spacing}": @spacing,
      "input-group-sm": @size == "small",
      "input-group-lg": @size == "large"
    }}>
      <Context put={{ SurfaceBootstrap.InputGroup, in_group: true }}>
        <slot />
      </Context>
    </div>
    """
  end
end
