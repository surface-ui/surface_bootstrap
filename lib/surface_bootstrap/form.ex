defmodule SurfaceBootstrap.Form do
  use Surface.Component
  @doc "Helper function used by the form controls"
  def field_has_error?(form, field) do
    Enum.any?(form.errors, fn {field_name, _} ->
      field_name == field
    end)
  end

  @doc "Helper function used by the form controls"
  def field_has_change?(form, field)

  def field_has_change?(%{source: atom}, _field) when is_atom(atom), do: false

  def field_has_change?(form, field) do
    !is_nil(Ecto.Changeset.get_change(form.source, field, false))
  end

  def render(assigns) do
    ~F"""

    """
  end
end
