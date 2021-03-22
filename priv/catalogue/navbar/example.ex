defmodule SurfaceBootstrap.Catalogue.NavBar.Example do
  use Surface.Catalogue.Example,
    subject: SurfaceBootstrap.NavBar,
    catalogue: SurfaceBootstrap.Catalogue,
    title: "Sample navbars",
    direction: "vertical",
    height: "700px"

  alias Surface.Components.Link
  alias SurfaceBootstrap.{Container, NavBar}
  alias SurfaceBootstrap.NavBar.Item
  alias SurfaceBootstrap.DropDown
  alias SurfaceBootstrap.DropDown.Item, as: DropDownItem

  def render(assigns) do
    ~H"""
    <Container class="mb-5">
      <NavBar>
        <Item group="left">
          <a class="nav-link" href="#">
            Menu
          </a>
        </Item>
        <Item group="right">
          <span class="navbar-text">This is text</span>
        </Item>
      </NavBar>
    </Container>

    <Container class="mb-5">
      <NavBar>
        <Item group="left">
          <a class="nav-link" href="#">
            Menu
          </a>
        </Item>
        <Item group="left">
          <a class="nav-link" href="#">
            Menu 2
          </a>
        </Item>
      </NavBar>
    </Container>

    <Container class="mb-5">
      <NavBar bg_color="primary">
        <Item group="middle">
          <a class="nav-link active" href="#">
            Menu in middle
          </a>
        </Item>
      </NavBar>
    </Container>

    <Container class="mb-5">
      <NavBar color_type="dark" bg_color="info">
        <Item group="left">
          <a class="nav-link" href="#">
            Menu
          </a>
        </Item>
        <Item group="left">
          <a class="nav-link" href="#">
            Menu 2
          </a>
        </Item>
        <Item group="right">
          <a class="nav-link active" href="#">
            Menu right
          </a>
        </Item>
      </NavBar>
    </Container>

    <Container class="mb-5">
      <NavBar>
        <Item group="left">
          <a class="nav-link" href="#">
            Menu
          </a>
        </Item>
        <Item group="right">
          <DropDown id="foo" wrapper="nav_item" label="Drop left" split direction="left">
            <DropDownItem>
              <Link to="#" class="dropdown-item">Menu item 1</Link>
            </DropDownItem>
            <DropDownItem>
              <hr class="dropdown-divider" />
            </DropDownItem>
            <DropDownItem>
              <Link to="#" class="dropdown-item">Menu item 2</Link>
            </DropDownItem>
          </DropDown>
        </Item>
      </NavBar>
    </Container>

    <Container class="mb-5">
      <NavBar>
        <Item group="left">
          <a class="nav-link" href="#">
            Menu
          </a>
        </Item>
        <Item group="right">
          <DropDown id="foo" wrapper="nav_item" label="John Doe">
            <DropDownItem>
              <Link to="#" class="dropdown-item">Edit profile</Link>
            </DropDownItem>
            <DropDownItem>
              <hr class="dropdown-divider" />
            </DropDownItem>
            <DropDownItem>
              <Link to="#" class="dropdown-item">Log out</Link>
            </DropDownItem>
          </DropDown>
        </Item>
      </NavBar>
    </Container>
    """
  end
end
