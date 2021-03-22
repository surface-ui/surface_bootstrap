defmodule Surface.Components.ButtonTest do
  use SurfaceBootstrap.ConnCase, async: true

  alias SurfaceBootstrap.Button

  test "creates a <button> with type and class btn" do
    html =
      render_surface do
        ~H"""
        <Button>
          Ok
        </Button>
        """
      end

    parsed = Floki.parse_fragment!(html)
    assert [{_, [{"type", "button"}, {"class", "btn"}], _}] = Floki.find(parsed, "button")
  end

  test "classes propagate to button" do
    html =
      render_surface do
        ~H"""
        <Button class={{ "custom", "custom2" }}>
          Ok
        </Button>
        """
      end

    parsed = Floki.parse_fragment!(html)

    assert [{_, [{"type", "button"}, {"class", "custom custom2"}], _}] =
             Floki.find(parsed, "button")

    html =
      render_surface do
        ~H"""
        <Button class="custom custom2">
          Ok
        </Button>
        """
      end

    parsed = Floki.parse_fragment!(html)

    assert [{_, [{"type", "button"}, {"class", "custom custom2"}], _}] =
             Floki.find(parsed, "button")
  end

  test "aria label" do
    html = render_surface(do: ~H(<Button aria_label="Ok">Ok</Button>))

    parsed = Floki.parse_fragment!(html)

    assert [{_, [{"aria-label", "Ok"}, {"type", "button"}, {"class", "btn"}], _}] =
             Floki.find(parsed, "button")
  end

  test "prop label" do
    html = render_surface(do: ~H(<Button label="Ok"/>))

    parsed = Floki.parse_fragment!(html)
    assert "Ok" = Floki.find(parsed, "button") |> Floki.text() |> String.trim()
  end

  test "prop color" do
    html = render_surface(do: ~H(<Button color="primary">Ok</Button>))
    assert html =~ ~r/class="(.*)btn-primary(.*)"/
  end

  test "prop size" do
    html = render_surface(do: ~H(<Button size="small">Ok</Button>))
    assert html =~ ~r/class="(.*)btn-sm(.*)"/
  end

  test "property value" do
    html = render_surface(do: ~H(<Button value="123">Ok</Button>))
    assert html =~ ~r/value="123"/
  end

  test "property outlined" do
    html = render_surface(do: ~H(<Button outlined color="primary">Ok</Button>))
    assert html =~ ~r/class="(.*)btn-outline-primary(.*)"/
  end

  test "property rounded" do
    html = render_surface(do: ~H(<Button rounded>Ok</Button>))
    assert html =~ ~r/class="(.*)rounded-pill(.*)"/
  end

  test "property loading" do
    html = render_surface(do: ~H(<Button loading>Ok</Button>))
    assert html =~ ~r/class="(.*)spinner-border(.*)"/
  end
end
