defmodule Surface.Components.ModalTest do
  use SurfaceBootstrap.ConnCase, async: true

  alias SurfaceBootstrap.Button
  alias SurfaceBootstrap.Modal.Footer
  alias SurfaceBootstrap.Modal

  test "renders regular modal with simple text in it" do
    html =
      render_surface do
        ~F"""
        <Modal id="foo">hello</Modal>
        """
      end

    parsed = Floki.parse_fragment!(html)

    assert Floki.find(parsed, "div.modal-dialog > div.modal-content > div.modal-body")
           |> Floki.text() =~ "hello"
  end

  test "regular modal can contain anything" do
    html =
      render_surface do
        ~F"""
        <Modal id="foo"><Button>ok</Button></Modal>
        """
      end

    parsed = Floki.parse_fragment!(html)
    assert [{"button", _, _}] = Floki.find(parsed, "div.modal-body > button")
  end

  test "card modal should display content in header, footer and default slot" do
    html =
      render_surface do
        ~F"""
        <Modal id="foo" header="headertext">
          hello
          <Footer>
            footertext
          </Footer>
        </Modal>
        """
      end

    parsed = Floki.parse_fragment!(html)

    assert "headertext" =
             Floki.find(parsed, "div.modal-header > h5") |> Floki.text() |> String.trim()

    assert "hello" = Floki.find(parsed, "div.modal-body") |> Floki.text() |> String.trim()
    assert "footertext" = Floki.find(parsed, "div.modal-footer") |> Floki.text() |> String.trim()
  end

  test "Modal should not have header if show close is false and header text is missing" do
    html =
      render_surface do
        ~F"""
        <Modal id="foo" show_close_button={false}>
          hello
        </Modal>
        """
      end

    parsed = Floki.parse_fragment!(html)

    assert [] = Floki.find(parsed, "div.modal-header")

    assert "hello" = Floki.find(parsed, "div.modal-body") |> Floki.text() |> String.trim()
  end
end
