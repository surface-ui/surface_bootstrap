defmodule SurfaceBootstrap.Icon do
  @moduledoc """
  Bootstrap icons, requires installation or CDN usage, see:
  https://icons.getbootstrap.com/#install
  """

  use Surface.Component

  @colors ~w(primary secondary success danger warning info light dark)

  @doc "Which icon to show"
  prop icon, :string

  @doc "Icon color"
  prop color, :string, values: @colors

  @doc "Detailed css style colors"
  prop style_color, :string

  @doc "Size as defined in rem, must be specified in decimal format using as a string `.` as the decimal separator (\"0.25\", \"1.5\" etc)"
  prop rem_size, :decimal

  @doc "Role prop for accessibility"
  prop role, :string

  @doc "For manual style setting, will ignore style_color and rem_size"
  prop style, :string

  def render(assigns) do
    ~F"""
    <i class={
      "bi-#{@icon}",
      "text-#{@color}":
      @color && is_nil(@style_color) }
      :attrs={attrs_parse(@style, @style_color, @rem_size, @role)}/>
    """
  end

  defp attrs_parse(nil, style_color, rem_size, role) do
    %{
      style: parse_style_color(style_color) |> parse_rem_size(rem_size),
      role: role
    }
  end

  defp attrs_parse(style, _, _, role) do
    %{
      style: style,
      role: role
    }
  end

  defp parse_style_color(nil), do: ""

  defp parse_style_color(style_color) do
    "color: #{style_color};"
  end

  defp parse_rem_size(style_color, nil) do
    if style_color == "" do
      nil
    else
      style_color
    end
  end

  defp parse_rem_size(style_color, rem_size) do
    if style_color == "" do
      "font-size: #{rem_size}rem;"
    else
      style_color <> " font-size: #{rem_size}rem;"
    end
  end
end
