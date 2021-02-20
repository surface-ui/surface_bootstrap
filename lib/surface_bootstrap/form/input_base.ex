defmodule SurfaceBootstrap.Form.InputBase do
  defmacro __using__(_) do
    quote do
      import SurfaceBootstrap.Form.InputBase

      alias SurfaceBootstrap.Form.BootstrapErrorTag
      alias Surface.Components.Raw
      alias Surface.Components.Form.{FieldContext, Label}

      @doc "The the field on the changeset"
      prop field, :atom, required: true

      @doc "Pre populated value"
      prop value, :any

      @doc "The string label of the field"
      prop label, :string

      @doc "Class to apply to input"
      prop class, :css_class, default: []

      @doc "Any opts you want to pass on to internal `input` from `Phoenix.HTML.Form`"
      prop opts, :keyword, default: []

      @doc "Disable input"
      prop disabled, :boolean

      @doc """
      Help text, will be replaced by error text if changeset gets errors.
      Should not be used on inputs inside `InputGroup`
      """
      prop help_text, :string

      @doc "Triggered when the component loses focus"
      prop blur, :event, default: nil

      @doc "Triggered when the component receives focus"
      prop focus, :event

      @doc "Triggered when the component receives click"
      prop capture_click, :event

      @doc "Triggered when a button on the keyboard is pressed"
      prop keydown, :event

      @doc "Triggered when a button on the keyboard is released"
      prop keyup, :event

      @doc "Margin below form control, to create spacing. Defaults to 3. Is ignored if input is inside an `InputGroup`."
      prop spacing, :string, default: "3", values: ~w(1 2 3 4 5)

      @doc "Size of the input, defaults to nil(normal)"
      prop size, :string, values: ~w(small large)

      @doc "Is input in group? Set to true if used in `InputGroup`, defaults to false"
      prop in_group, :boolean, default: false

      def update(assigns, socket) do
        socket = assign(socket, assigns)

        case get_in(assigns, [:__context__, {SurfaceBootstrap.InputGroup, :in_group}]) do
          true ->
            {:ok, assign(socket, :in_group, true)}

          _ ->
            {:ok, socket}
        end
      end

      defp optional_div(%{in_group: true}) do
        ""
      end

      defp optional_div(
             %{spacing: spacing, floating_label: floating_label, in_group: in_group} = assigns
           ) do
        has_left_right = Map.get(assigns, :show_value) in ["left", "right"]
        has_floating_label = assigns.floating_label && !has_left_right

        class =
          css_class(
            "mb-#{spacing}": spacing,
            "form-floating": has_floating_label,
            "input-group": !in_group && has_left_right
          )

        ~s(<div class="#{class}">)
      end

      defp help_text(%{help_text: nil}), do: nil

      defp help_text(%{help_text: text}) do
        """
        <div class="form-text">
        #{raw(text)}
        </div>
        """
      end
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

  def input_classes(assigns) do
    [
      "form-control",
      form_size(assigns[:size]),
      "is-invalid": has_change?(assigns) && has_error?(assigns),
      "is-valid": has_change?(assigns) && !has_error?(assigns),
      "form-control-plaintext": assigns[:readonly] && assigns[:readonly_plaintext]
    ]
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

  def default_core_input_opts(assigns) do
    Map.take(assigns, [
      :disabled,
      :readonly,
      :max,
      :min,
      :step,
      :minlength,
      :maxlength,
      :rows,
      :placeholder
    ])
    |> Keyword.new()
  end

  def default_surface_input_props(assigns) do
    Map.take(assigns, [
      :blur,
      :focus,
      :capture_click,
      :keydown,
      :keyup
    ])
    |> Keyword.new()
  end
end
