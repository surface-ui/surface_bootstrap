defmodule SurfaceBootstrap.Form.TextInputBase do
  defmacro __using__(_) do
    quote do
      use SurfaceBootstrap.Form.InputBase
      use SurfaceBootstrap.Form.InputIconBase
      use SurfaceBootstrap.Form.InputAddonBase
      @doc "Placeholder value"
      prop placeholder, :string, default: nil
    end
  end
end
