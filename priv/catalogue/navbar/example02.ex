defmodule SurfaceBootstrap.Catalogue.NavBar.Example02 do
  use Surface.Catalogue.Example,
    subject: SurfaceBootstrap.NavBar,
    catalogue: SurfaceBootstrap.Catalogue,
    title: "Sidebar (make page smaller to see reactive)",
    direction: "vertical",
    height: "700px"

  alias Surface.Components.Link
  alias SurfaceBootstrap.{Column, Container, NavBar, Row}
  alias SurfaceBootstrap.DropDown
  alias SurfaceBootstrap.DropDown.Item, as: DropDownItem

  data props, :map,
    default: %{
      ipsum: """
      "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
      """
    }

  def render(assigns) do
    ~H"""
    <NavBar
      placement="sticky_top"
      collapsible=false
      color_type="dark"
      bg_color="dark"
      class="flex-md-nowrap p-0"
    >
      <a class="navbar-brand col-md-3 me-0 px-3 pb-3">Company name</a>
      <NavBar.Toggler
        target_id="sidebar"
        class="position-absolute d-md-none"
        style="top: .25rem; right: 1rem;"
      />
      <input
        class="form-control w-100"
        type="text"
        placeholder="Search"
        aria-label="Search"
        style="color: #fff;
    background-color: rgba(255, 255, 255, .1);
    border-color: rgba(255, 255, 255, .1);"
      />
      <NavBar.ItemGroup>
        <NavBar.ListItem class="text-nowrap">
          <a class="nav-link px-3" href="#">
            Sign out
          </a>
        </NavBar.ListItem>
      </NavBar.ItemGroup>
    </NavBar>
    <Container breakpoint="fluid">
      <Row>
        <NavBar
          id="sidebar"
          sidebar
          collapsible=false
          sidebar_collapse
          class="col-md-3 d-md-block"
          container_size={{ nil }}
          container_class="position-sticky"
        >
          <NavBar.ItemGroup class="flex-column">
            <NavBar.ListItem>
              <a class="nav-link" href="#">
                Menu item 1
              </a>
            </NavBar.ListItem>
            <NavBar.ListItem>
              <a class="nav-link" href="#">
                Menu item 2
              </a>
            </NavBar.ListItem>
            <NavBar.ListItem>
              <a class="nav-link" href="#">
                Menu item 3
              </a>
            </NavBar.ListItem>
            <NavBar.ListItem>
              <a class="nav-link" href="#">
                Menu item 4
              </a>
            </NavBar.ListItem>
            <NavBar.ListItem>
              <a class="nav-link" href="#">
                Menu item 5
              </a>
            </NavBar.ListItem>
          </NavBar.ItemGroup>
          <h6 class="text-muted pt-3">SUBMENU</h6>
          <NavBar.ItemGroup class="flex-column">
            <NavBar.ListItem>
              <a class="nav-link" href="#">
                Another menu item 1
              </a>
            </NavBar.ListItem>
            <NavBar.ListItem>
              <a class="nav-link" href="#">
                Another menu item 2
              </a>
            </NavBar.ListItem>
            <NavBar.ListItem>
              <a class="nav-link" href="#">
                Another menu item 3
              </a>
            </NavBar.ListItem>
            <NavBar.ListItem>
              <a class="nav-link" href="#">
                Another menu item 4
              </a>
            </NavBar.ListItem>
            <NavBar.ListItem>
              <a class="nav-link" href="#">
                Another menu item 5
              </a>
            </NavBar.ListItem>
          </NavBar.ItemGroup>
        </NavBar>
        <Column width="9" class="pt-1">
          {{ @props.ipsum }}
        </Column>
      </Row>
    </Container>
    """
  end
end
