defmodule SurfaceBootstrap.DropDown do
  @moduledoc """
  The dropdown component.

  https://getbootstrap.com/docs/5.0/components/dropdowns/
  """
  use Surface.LiveComponent

  @doc """
  Decides the wrapper element, possible options are
  - dropdown -- Gives a `<div class="dropdown">` (default)
  - btn_group -- Gives a `<div class="btn-group">` (defaults to this automatically if `split == true`)
  - nav_item -- Gives a `<li class="nav-item dropdown">` (to be used when rendering a dropdown in a NavBar)
  """
  prop wrapper, :string,
    required: true,
    values: ~w(dropdown btn_group nav_item),
    default: "dropdown"

  @doc "Show as button? Defaults true (is still anchor element)"
  prop button, :boolean, default: true

  @doc "Show dropdown with a separate arrow to click on (split view)? Defaults false"
  prop split, :boolean

  data open, :boolean

  def render(assigns) do
    ~H"""
      {{raw(wrapper_start(@wrapper))}}
      <slot />
      {{raw(wrapper_end(@wrapper))}}
    """
  end

  defp wrapper_start(wrapper) do
    case wrapper do
      "dropdown" ->
        ~s(<div class="dropdown">)

      "btn_group" ->
        ~s(<div class="btn-group">)

      "nav_item" ->
        ~s(<li class="nav-item dropdown">)
    end
  end

  defp wrapper_end(wrapper) do
    case wrapper do
      "dropdown" ->
        ~s(</div>)

      "btn_group" ->
        ~s(</div>)

      "nav_item" ->
        ~s(</li>)
    end
  end
end
