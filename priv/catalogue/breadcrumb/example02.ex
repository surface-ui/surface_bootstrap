defmodule SurfaceBootstrap.Catalogue.Breadcrumb.Example02 do
  use Surface.Catalogue.Example,
    subject: SurfaceBootstrap.Breadcrumb,
    catalogue: SurfaceBootstrap.Catalogue,
    title: "Using renderless slotables",
    height: "90px",
    direction: "vertical"

  def render(assigns) do
    ~F"""
    <Breadcrumb link_type="link" >
    <Breadcrumb.Item text="home" url="#"/>
    <Breadcrumb.Item text="users" url="#/users"/>
    <Breadcrumb.Item text="John Doe" url="#users/1234" active/>
    </Breadcrumb>
    """
  end
end
