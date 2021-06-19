defmodule SurfaceBootstrap.Button do
  @moduledoc """
  A Button element as defined by https://getbootstrap.com/docs/5.0/components/buttons/
  """

  @button_colors ~w(primary secondary success danger warning info light dark)
  @button_sizes ~w(small large)

  use Surface.Component
  use SurfaceBootstrap.AriaBase

  @doc """
  The button type, defaults to "button", mainly used for instances like modal X to close style buttons
  where you don't want to set a type at all. Setting to nil makes button have no type.
  """
  prop type, :string, default: "button"

  @doc "The label of the button, when no content (default slot) is provided"
  prop label, :string

  @doc "The color of the button"
  prop color, :string, values: @button_colors

  @doc "The size of button, setting nothing equals normal size"
  prop size, :string, values: @button_sizes
  @doc "The value for the button"
  prop value, :string

  @doc "Set the button as disabled preventing the user from interacting with the control"
  prop disabled, :boolean

  @doc "Outlined style"
  prop outlined, :boolean

  @doc "Rounded pill style"
  prop rounded, :boolean

  @doc "Loading state"
  prop loading, :boolean

  @doc "Text to display on button while loading, overwrites label while loading."
  prop loading_text, :string

  @doc "Should the label show when button is loading? Defaults to true."
  prop loading_label, :boolean, default: true

  @doc "Triggered on click"
  prop click, :event

  @doc "Title prop"
  prop title, :string

  @doc "Css classes to propagate down to button. Default class if no class supplied is simply _btn_"
  prop class, :css_class, default: []

  @doc """
  The content of the generated `<button>` element. If no content is provided,
  the value of property `label` is used instead.
  """
  slot default

  def render(assigns) do
    ~F"""
    <button
      :attrs={set_aria_base_attrs(assigns)}
      type={@type}
      :on-click={@click}
      disabled={@disabled}
      value={@value}
      title={@title}
      class={[
        btn: @class == [],
        "rounded-pill": @rounded
      ] ++
        button_classes(assigns) ++ @class}
    >
      <#slot :if={!@loading}>{@label}</#slot>
      {#if @loading}
        <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true" />
        <span :if={@loading_label} class="sr-only" />
        {#if @loading_text}
          {@loading_text}
        {/if}
        {#if @loading_label && !@loading_text}
          <#slot>{@label}</#slot>
        {/if}
      {/if}
    </button>
    """
  end

  defp button_classes(assigns) do
    button_class(assigns) ++
      button_size(assigns)
  end

  defp button_class(assigns = %{color: color}) when color in @button_colors do
    cond do
      assigns.outlined ->
        ["btn-outline-#{assigns.color}"]

      true ->
        ["btn-#{assigns.color}"]
    end
  end

  defp button_class(_), do: []

  defp button_size(%{size: size}) when size in @button_sizes do
    case size do
      "small" ->
        ["btn-sm"]

      "large" ->
        ["btn-lg"]
    end
  end

  defp button_size(_), do: []
end
