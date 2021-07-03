defmodule SurfaceBootstrap.DropDown do
  @moduledoc """
  The dropdown component.

  https://getbootstrap.com/docs/5.0/components/dropdowns/

  The `@wrapper` property changes the container wrapper for this component
  and is meant to be used to change which context the dropdown is used in.

  The values for `@wrapper` are:
  - default -- Gives a `<div class="dropdown">`
  - btn_group -- Gives a `<div class="btn-group">` (defaults to this automatically if `split == true`)
  - nav_item -- Gives a `<li class="nav-item dropdown">` (to be used when rendering a dropdown in a NavBar)
  - raw -- Special case that gives a `<div class="dropdown">` with inner container `<div class="dropdown-menu"`> to be used to create forms or text dropdowns that emits the content of the default slot.

  To create forms or text dropdowns read more here:
  - https://getbootstrap.com/docs/5.0/components/dropdowns/#forms
  - https://getbootstrap.com/docs/5.0/components/dropdowns/#text

  Take special note on padding x and padding y to make form look good inside dropdown.

  """
  use Surface.Component
  @button_colors ~w(primary secondary success danger warning info light dark)

  @doc "ID of dropdown, required to work"
  prop id, :string, required: true

  @doc "Label of dropdown link/button. Use button_content to provide inner content."
  prop label, :string

  @doc """
  If prop `split` is set to `true`, wrapper type is automatically set to `btn_group`.
  """
  prop wrapper, :string,
    values: ~w(default btn_group nav_item raw),
    default: "default"

  @doc """
  Direction of dropper, will override dynamic positioning
  (as in if you dont define a dropdown will drop up if it would render outside page.
  Nil or not set equals dropping down as default behaviour.
  """
  prop direction, :string, values: ~w(left right up)

  @doc "Show as button? Defaults true (is still anchor element) and is forced to true if `@split = true`"
  prop button, :boolean, default: true

  @doc "The color of the button (ignored if button=false)"
  prop color, :string, values: @button_colors

  prop button_size, :string, values: ~w(small normal large), default: "normal"

  @doc "Custom class for the dropdown button"
  prop button_class, :css_class, default: []

  @doc "Custom class for the wrapper"
  prop wrapper_class, :css_class, default: []

  @doc "Custom class for the dropdown menu"
  prop menu_class, :css_class, default: []

  @doc """
  Show dropdown with a separate arrow to click on (split view)? Defaults false.
  If set to true will automatically set `@wrapper = "btn_group"` and `@button = true`.
  """
  prop split, :boolean

  @doc "Display a dark dropdown"
  prop dark, :boolean

  @doc "Show dropdown as active"
  prop active, :boolean

  slot button_content

  slot dropdown_items

  slot default

  def update(assigns, socket) do
    socket = assign(socket, assigns)

    if assigns.split == true do
      assign(socket, :button, true)
      |> assign(:wrapper, "btn_group")
    else
      socket
    end

    {:ok, socket}
  end

  def render(assigns = %{wrapper: wrapper}) when wrapper in ["dropdown", "btn_group"] do
    ~F"""
    <div
      id={@id}
      :hook="DropDown"
      class={
        [dropdown: @wrapper == "dropdown" && !@direction,
        dropup: @direction == "up",
        dropend: @direction == "right",
        dropstart: @direction == "left",
        "btn-group": @wrapper == "btn_group" || @split == true] ++ @wrapper_class
      }
      :attrs={
        "data-bsnclass": "show"
      }
    >
      {content(assigns)}
    </div>
    """
  end

  def render(assigns = %{wrapper: "nav_item"}) do
    ~F"""
    <li
      id={@id}
      :hook="DropDown"
      class={
        ["nav-item",
        dropdown: !@direction,
        dropup: @direction == "up",
        dropend: @direction == "right",
        dropstart: @direction == "left",
        "btn-group": @wrapper == "btn_group" || @split == true] ++ @wrapper_class
      }
      :attrs={
        "data-bsnclass": "show"
      }
    >
      {content(assigns)}
    </li>
    """
  end

  defp content(assigns = %{direction: "left", split: true}) do
    ~F"""
    {primary_button_split(assigns)}
    {dropdown_container(assigns)}
    {primary_button(assigns)}
    """
  end

  defp content(assigns = %{split: true}) do
    ~F"""
    {primary_button(assigns)}
    {primary_button_split(assigns)}
    {dropdown_container(assigns)}
    """
  end

  defp content(assigns) do
    ~F"""
    {primary_button(assigns)}
    {dropdown_container(assigns)}
    """
  end

  defp primary_button(assigns) do
    ~F"""
    <a
      id={@id <> "dropdown"}
      class={
        ["dropdown-toggle": !@split,
        "nav-link": @wrapper == "nav_item",
        active: @active,
        btn: @button,
        "btn-#{@color}": @button && @color,
        "btn-lg": @button && @button_size == "large",
        "btn-sm": @button && @button_size == "small"] ++ @button_class
      }
      href={!@split && "#"}
    >
      <#slot name="button_content">
        {@label}
      </#slot>
    </a>
    """
  end

  defp primary_button_split(assigns) do
    ~F"""
    <button
      type="button"
      id={@id <> "dropdown-split"}
      class={
        "btn",
        "dropdown-toggle",
        "dropdown-toggle-split",
        active: @active,
        "btn-#{@color}": @button && @color,
        "btn-lg": @button && @button_size == "large",
        "btn-sm": @button && @button_size == "small"
      }
      :attrs={
        "data-bsnclass": "show"
      }
      href="#"
    ><span class="visually-hidden" />
    </button>
    """
  end

  defp dropdown_container(assigns = %{wrapper: "raw"}) do
    ~F"""
    <div
      class={
        ["dropdown-menu",
        "dropdown-menu-dark": @dark] ++ @menu_class
      }
      :attrs={
        "data-bsnstyle": true,
        "aria-labelledby": @id
      }
    >
      <#slot />
    </div>
    """
  end

  defp dropdown_container(assigns) do
    ~F"""
    <ul
      class={
        ["dropdown-menu",
        "dropdown-menu-dark": @dark] ++ @menu_class
      }
      :attrs={
        "data-bsnstyle": true,
        "aria-labelledby": @id
      }
    >
      {#for {_item, index} <- Enum.with_index(@dropdown_items)}
        <#slot name="dropdown_items" index={index} />
      {/for}
    </ul>
    """
  end
end
