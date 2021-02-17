defmodule SurfaceBootstrap.Form.BootstrapErrorTag do
  @moduledoc """
  Field that holds common markup for form controls.

  https://getbootstrap.com/docs/5.0/forms/form-control/
  """
  use Surface.Component
  alias Surface.Components.Form.Input.InputContext

  @doc "Does field have error?"
  prop has_error, :boolean

  @doc "Does field have change?"
  prop has_change, :boolean

  def render(assigns) do
    translate_error = translator_from_config() || (&translate_error/1)

    ~H"""
    <InputContext assigns={{ assigns }} :let={{ form: form, field: field }}>
      <div :if={{ @has_error && @has_change }} class="invalid-feedback">
        <For each={{ error <- Keyword.get_values(form.errors, field) }}>
          {{ translate_error.(error) }}
        </For>
      </div>
    </InputContext>
    """
  end

  @doc """
  Translates an error message.

  This is the fallback (Phoenix's default implementation) if a translator
  is not provided via config or the `translate` prop.
  """
  def translate_error({msg, opts}) do
    # Because the error messages we show in our forms and APIs
    # are defined inside Ecto, we need to translate them dynamically.
    Enum.reduce(opts, msg, fn {key, value}, acc ->
      String.replace(acc, "%{#{key}}", to_string(value))
    end)
  end

  defp translator_from_config do
    case get_config(:default_translator) do
      {module, function} -> &apply(module, function, [&1])
      nil -> nil
    end
  end
end
