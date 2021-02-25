defmodule SurfaceBootstrap.DropDown do
  @moduledoc """
  The dropdown component.

  https://getbootstrap.com/docs/5.0/components/dropdowns/
  """
  use Surface.LiveComponent

  @doc "Show dropdown with a separate arrow to click on (split view)? Defaults false"
  prop split, :boolean

  data(open)

  # def render(assigns) do
  #   ~H"""
  #   <div class={{
  #     [
  #       "btn-group": @split
  #     ]
  #    }}>
  #     <slot />
  #   </div>
  #   """
  # end
end
