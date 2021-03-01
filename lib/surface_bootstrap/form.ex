defmodule SurfaceBootstrap.Form do
  @doc "Helper function used by the form controls"
  def field_has_error?(form, field) do
    Enum.any?(form.errors, fn {field_name, _} ->
      field_name == field
    end)
  end

  @doc "Helper function used by the form controls"
  def field_has_change?(form, field) do
    Ecto.Changeset.get_change(form.source, field, false)
  end
end
