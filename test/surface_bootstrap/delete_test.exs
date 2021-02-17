defmodule Surface.Components.DeleteTest do
  use SurfaceBootstrap.ConnCase, async: true

  alias SurfaceBootstrap.Delete

  test "creates a link element with class delete" do
    html =
      render_surface do
        ~H"""
        <Delete />
        """
      end

    assert html =~ """
           <a class="delete">
           </a>
           """
  end

  test "prop size" do
    html =
      render_surface do
        ~H"""
        <Delete size="small"/>
        """
      end

    assert html =~ """
           <a class="delete is-small">
           </a>
           """
  end
end
