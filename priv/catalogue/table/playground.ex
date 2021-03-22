defmodule SurfaceBootstrap.Catalogue.Table.Playground do
  use Surface.Catalogue.Playground,
    subject: SurfaceBootstrap.Table,
    catalogue: SurfaceBootstrap.Catalogue,
    height: "350px"

  alias SurfaceBootstrap.Table.Column

  data props, :map,
    default: %{
      data: [
        %{id: 1, name: "John"},
        %{id: 2, name: "Jane"},
        %{id: 3, name: "Albert"},
        %{id: 4, name: "Diana"},
        %{id: 5, name: "Elizabeth"}
      ]
    }

  def render(assigns) do
    ~H"""
    <Table id="foo" data={{ person <- @props.data }} :props={{ @props }}>
      <Column width="1" label="Id" sort_by="id">
        {{ person.id }}
      </Column>
      <Column width="11" label="Name" sort_by="name" footer="footer!">
        {{ person.name }}
      </Column>
    </Table>
    """
  end
end
