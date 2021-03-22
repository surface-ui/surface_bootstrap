defmodule Surface.Components.IconTest do
  use SurfaceBootstrap.ConnCase, async: true

  alias SurfaceBootstrap.Icon

  test "basic icon usage" do
    html =
      render_surface do
        ~H"""
        <Icon icon="check-square-fill" />
        """
      end

    assert html =~
             """
             <i class="bi-check-square-fill"></i>
             """
  end

  test "color icon usage" do
    html =
      render_surface do
        ~H"""
        <Icon icon="check-square-fill" color="primary" />
        """
      end

    assert html =~
             """
             <i class="bi-check-square-fill text-primary"></i>
             """
  end
end
