defmodule SurfaceBootstrap.Catalogue.Table.Example01 do
  use Surface.Catalogue.Example,
    subject: SurfaceBootstrap.Table,
    catalogue: SurfaceBootstrap.Catalogue,
    title: "Sortable prop columns",
    height: "300px"

  alias SurfaceBootstrap.Table
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
      <Column width="2" label="Id" sort_by="id">
        {{ person.id }}
      </Column>
      <Column width="10" label="Name" sort_by="name">
        {{ person.name }}
      </Column>
    </Table>
    """
  end
end
