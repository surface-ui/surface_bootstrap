defmodule SurfaceBootstrap.Card.Body.Title do
  @moduledoc """
  Card title component

  https://getbootstrap.com/docs/5.0/components/card/
  """
  use Surface.Component

  prop title, :string, required: true

  prop title_size, :string, values: ~w(1 2 3 4 5 6), default: "5"

  prop title_class, :css_class, default: []

  prop sub_title, :string

  prop sub_title_size, :string, values: ~w(1 2 3 4 5 6), default: "6"

  prop sub_title_class, :css_class, default: []

  def render(assigns) do
    ~H"""
    {{ raw(h_opener(@title_size, @title_class)) }}
    {{ @title }}
    {{ raw(h_closer(@title_size)) }}
    <If condition={{ @sub_title }}>
      {{ raw(h_opener(@sub_title_size, @sub_title_class)) }}
      {{ @sub_title }}
      {{ raw(h_closer(@sub_title_size)) }}
    </If>
    """
  end

  defp h_opener(title_size, title_class) do
    ~s(<h#{title_size} class="#{css_class(["card-title"] ++ title_class)}">)
  end

  defp h_closer(title_size) do
    ~s(</h#{title_size}>)
  end
end
