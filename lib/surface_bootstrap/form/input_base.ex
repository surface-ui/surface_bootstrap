defmodule SurfaceBootstrap.Form.InputBase do
  defmacro __using__(_) do
    quote do
      import SurfaceBootstrap.Form.InputBase
      @doc "The the field on the changeset"
      prop field, :atom, required: true

      @doc "The string label of the field"
      prop label, :string

      @doc "Disable default fontawesome icons tied to validation"
      prop disable_icons, :boolean, default: false

      @doc "Class to apply to input"
      prop class, :css_class, default: []

      @doc "Any opts you want to pass on to internal `input` from `Phoenix.HTML.Form`"
      prop opts, :keyword, default: []

      @doc "Should input fill entire width of form?"
      prop expanded, :boolean

      @doc "Disable input"
      prop disabled, :boolean

      @doc "Static input"
      prop static, :boolean

      @doc "Read only"
      prop readonly, :boolean

      @doc """
      Help text, will be replaced by error text if changeset gets errors.
      Should not be used on inputs inside `InputGroup`
      """
      prop help_text, :string

      @doc "Triggered when the component loses focus"
      prop blur, :event

      @doc "Triggered when the component receives focus"
      prop focus, :event

      @doc "Triggered when the component receives click"
      prop capture_click, :event

      @doc "Triggered when a button on the keyboard is pressed"
      prop keydown, :event

      @doc "Triggered when a button on the keyboard is released"
      prop keyup, :event

      @doc "Margin below form control, to create spacing. Defaults to 3"
      prop spacing, :string, default: "3", values: ~w(1 2 3 4 5)

      @doc "Size of the input, defaults to nil(normal)"
      prop size, :string, values: ~w(small large)

      @doc "Is input in group? Set to true if used in `InputGroup`, defaults to false"
      prop in_group, :boolean, default: false
    end
  end

  import SurfaceBootstrap.Form, only: [field_has_error?: 2, field_has_change?: 2]

  def has_error?(assigns) do
    %{__context__: %{{Surface.Components.Form, :form} => form}} = assigns

    field_has_error?(form, assigns.field)
  end

  def has_change?(assigns) do
    %{__context__: %{{Surface.Components.Form, :form} => form}} = assigns

    field_has_change?(form, assigns.field)
  end

  def form_size(size) do
    case size do
      "large" ->
        "form-control-lg"

      "small" ->
        "form-control-sm"

      _ ->
        nil
    end
  end
end
