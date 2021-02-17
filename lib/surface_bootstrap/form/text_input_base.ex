defmodule SurfaceBootstrap.Form.TextInputBase do
  defmacro __using__(_) do
    quote do
      use SurfaceBootstrap.Form.InputBase
      use SurfaceBootstrap.Form.InputAddonBase
      @doc "Placeholder value"
      prop placeholder, :string, default: nil

      @doc """
      Floating label?
      https://getbootstrap.com/docs/5.0/forms/floating-labels/
      """
      prop floating_label, :boolean
    end
  end
end
