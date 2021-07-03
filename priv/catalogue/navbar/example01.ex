defmodule SurfaceBootstrap.Catalogue.NavBar.Example01 do
  use Surface.Catalogue.Example,
    subject: SurfaceBootstrap.NavBar,
    catalogue: SurfaceBootstrap.Catalogue,
    title: "Sample navbars (make page smaller to see reactive)",
    direction: "vertical",
    height: "700px"

  alias Surface.Components.Link
  alias SurfaceBootstrap.{Container, NavBar}
  alias SurfaceBootstrap.DropDown
  alias SurfaceBootstrap.DropDown.Item, as: DropDownItem

  def render(assigns) do
    ~F"""
    <Container class="mb-5">
      <NavBar collapsible_id="coll-id-5">
        <NavBar.ItemGroup>
          <NavBar.ListItem>
            <a class="nav-link" href="#">
              Menu
            </a>
          </NavBar.ListItem>
        </NavBar.ItemGroup>
        <NavBar.ItemGroup position="right">
          <NavBar.ListItem>
            <DropDown id="foo" wrapper="nav_item" label="Drop left" split direction="left">
              <DropDownItem>
                <Link to="#" class="dropdown-item">Menu item 1</Link>
              </DropDownItem>
              <DropDownItem>
                <hr class="dropdown-divider">
              </DropDownItem>
              <DropDownItem>
                <Link to="#" class="dropdown-item">Menu item 2</Link>
              </DropDownItem>
            </DropDown>
          </NavBar.ListItem>
        </NavBar.ItemGroup>
      </NavBar>
    </Container>

    <Container class="mb-5">
      <NavBar collapsible_id="coll-id-6">
        <NavBar.ItemGroup>
          <NavBar.ListItem>
            <a class="nav-link" href="#">
              Menu
            </a>
          </NavBar.ListItem>
        </NavBar.ItemGroup>
        <NavBar.ItemGroup position="right">
          <NavBar.ListItem>
            <DropDown id="foo" wrapper="nav_item" wrapper_class="d-inline" button_class="btn-outline-dark" button_size="small">
              <:button_content>
                <span class="text-primary">John Doe</span>
              </:button_content>
              <DropDownItem class="w-100">
                <Link to="#" class="dropdown-item">Edit profile</Link>
              </DropDownItem>
              <DropDownItem>
                <hr class="dropdown-divider">
              </DropDownItem>
              <DropDownItem>
                <Link to="#" class="dropdown-item">Log out</Link>
              </DropDownItem>
            </DropDown>
          </NavBar.ListItem>
        </NavBar.ItemGroup>
      </NavBar>
    </Container>
    <Container class="mb-5">
      <NavBar collapsible_id="coll-id-1">
        <NavBar.ItemGroup>
          <NavBar.ListItem>
            <a class="nav-link" href="#">
              Menu
            </a>
          </NavBar.ListItem>
          <span class="navbar-text">This is text</span>
        </NavBar.ItemGroup>
      </NavBar>
    </Container>

    <Container class="mb-5">
      <NavBar collapsible_id="coll-id-2">
        <NavBar.ItemGroup>
          <NavBar.ListItem>
            <a class="nav-link" href="#">
              Menu
            </a>
          </NavBar.ListItem>
          <NavBar.ListItem>
            <a class="nav-link" href="#">
              Menu 2
            </a>
          </NavBar.ListItem>
        </NavBar.ItemGroup>
      </NavBar>
    </Container>

    <Container class="mb-5">
      <NavBar bg_color="primary" collapsible_id="coll-id-3">
        <NavBar.ItemGroup>
          <NavBar.ListItem>
            <a class="nav-link active" href="#">
              Menu in middle
            </a>
          </NavBar.ListItem>
        </NavBar.ItemGroup>
      </NavBar>
    </Container>

    <Container class="mb-5">
      <NavBar color_type="dark" bg_color="info" collapsible_id="coll-id-4">
        <NavBar.ItemGroup>
          <NavBar.ListItem>
            <a class="nav-link" href="#">
              Menu
            </a>
          </NavBar.ListItem>
          <NavBar.ListItem>
            <a class="nav-link" href="#">
              Menu 2
            </a>
          </NavBar.ListItem>
        </NavBar.ItemGroup>
        <NavBar.ItemGroup position="right">
          <NavBar.ListItem>
            <a class="nav-link active" href="#">
              Menu right
            </a>
          </NavBar.ListItem>
        </NavBar.ItemGroup>
      </NavBar>
    </Container>
    """
  end
end
