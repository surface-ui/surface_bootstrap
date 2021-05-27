defmodule SurfaceBootstrap.JustifyBase do
  defmacro __using__(_) do
    quote do
      @doc "Justify content inside"
      prop justify, :string, values: ~w(start end center between around evenly)

      defp justify_class(justify) do
        Surface.css_class("justify-content-#{justify}": justify)
      end
    end
  end
end
