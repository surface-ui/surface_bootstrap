defmodule SurfaceBootstrap.Catalogue.Tab.Example01 do
  use Surface.Catalogue.Example,
    subject: SurfaceBootstrap.Tab,
    catalogue: SurfaceBootstrap.Catalogue,
    title: "Tabs",
    direction: "vertical",
    height: "300px"

  alias Surface.Components.Link
  alias SurfaceBootstrap.{Container, Tab}
  alias SurfaceBootstrap.DropDown
  alias SurfaceBootstrap.DropDown.Item, as: DropDownItem

  def render(assigns) do
    ~H"""
    <Container class="mb-5">
      <Tab justified>
        <Tab.Item>
          <Link to="#" class="nav-link active">
            Menu that is loooong justified
          </Link>
        </Tab.Item>
        <Tab.Item>
          <Link to="#" class="nav-link">
            Shorter menu
          </Link>
        </Tab.Item>
        <Tab.Item>
          <Link to="#" class="nav-link">
            Short
          </Link>
        </Tab.Item>
      </Tab>
    </Container>

    <Container class="mb-5">
      <Tab fill>
        <Tab.Item>
          <a class="nav-link" href="#">
            Menu
          </a>
        </Tab.Item>
        <Tab.Item>
          <DropDown id="foo" wrapper="nav_item" label="Dropdown tab" active>
            <DropDownItem>
              <Link to="#" class="dropdown-item">Some submenu item</Link>
            </DropDownItem>
            <DropDownItem>
              <hr class="dropdown-divider" />
            </DropDownItem>
            <DropDownItem>
              <Link to="#" class="dropdown-item">Another submenu item</Link>
            </DropDownItem>
          </DropDown>
        </Tab.Item>
      </Tab>
    </Container>

    <Container class="mb-5">
      <Tab>
        <Tab.Item>
          <Link to="#" class="nav-link">
            Menu that is loooong
          </Link>
        </Tab.Item>
        <Tab.Item>
          <Link to="#" class="nav-link">
            Shorter menu
          </Link>
        </Tab.Item>
        <Tab.Item>
          <Link to="#" class="nav-link active">
            Short
          </Link>
        </Tab.Item>
      </Tab>
    </Container>
    """
  end
end
