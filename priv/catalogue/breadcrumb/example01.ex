defmodule SurfaceBootstrap.Catalogue.Breadcrumb.Example01 do
  use Surface.Catalogue.Example,
    subject: SurfaceBootstrap.Breadcrumb,
    catalogue: SurfaceBootstrap.Catalogue,
    title: "As proplist",
    height: "90px",
    direction: "vertical"

  @moduledoc """
    Done in assigns:
    ```
    breadcrumbs = [
      %{
        url: "",
        text: "home"
      },
      %{
        url: "#users",
        text: "users"
      },
      %{
        url: "#users/1234",
        text: "John Doe",
        active: true
      }
    ]
    ```
  """
  def render(assigns) do
    breadcrumbs = [
      %{
        url: "",
        text: "home"
      },
      %{
        url: "#users",
        text: "users"
      },
      %{
        url: "#/users/1234",
        text: "John Doe",
        active: true
      }
    ]

    ~F"""
    <Breadcrumb link_type="link" breadcrumbs={breadcrumbs} />
    """
  end
end
