defmodule SurfaceBootstrap.Form.TextInputBase do
  defmacro __using__(_) do
    quote do
      use SurfaceBootstrap.Form.InputBase

      alias SurfaceBootstrap.Form.BootstrapErrorTag

      @doc "Placeholder value"
      prop placeholder, :string, default: nil

      @doc """
      Floating label?
      https://getbootstrap.com/docs/5.0/forms/floating-labels/
      """
      prop floating_label, :boolean

      @doc "Read only"
      prop readonly, :boolean

      @doc "Read only plaintext, will be ignored if readonly is not true"
      prop readonly_plaintext, :boolean
    end
  end
end
