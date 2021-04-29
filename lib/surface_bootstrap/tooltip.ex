defmodule SurfaceBootstrap.Tooltip do
  @moduledoc """
  Tooltip component, implemented as a wrapper span.
  If wrapper=false (default), requires a title attribute to be
  set on the slotable content, or the tooltip will not be able to
  initialize.

  https://getbootstrap.com/docs/5.0/components/tooltips/
  """
  use Surface.Component

  @doc "Tooltip content, can be html. Will be ignored if wrapper=false (default)."
  prop title, :string

  @doc "Put tooltip on wrapper? Useful to tooltip disabled things like buttons"
  prop wrapper, :boolean

  @doc "Placement of tooltip, defaults top"
  prop placement, :string, default: "top", values: ~w(top left right bottom)

  @doc "Delay in milliseconds before tooltip pops up"
  prop delay, :integer

  @doc """
  Selector for where to attach the generated tooltip div.
  This defaults to `<body>` unless target is inside a navbar or a modal
  then it will default to that parent element to stay visible.
  """
  prop container_selector, :string

  @doc "Animation of tooltip. Defaults to 'fade'."
  prop animation, :string, default: "fade"

  slot default

  def render(assigns) do
    ~H"""
    <span
    :hook="Tooltip"
    id={{"tooltip-" <> Ecto.UUID.generate()}}
    data-wrapper={{@wrapper}}
    data-placement={{@placement}}
    data-delay={{@delay}}
    data-selector={{@container_selector}}
    data-animation={{@animation}}
    title={{@title}}>
      <slot />
    </span>
    """
  end
end
