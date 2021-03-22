defmodule SurfaceBootstrap.Catalogue.Form.RangeInput.Playground do
  use Surface.Catalogue.Playground,
    subject: SurfaceBootstrap.Form.RangeInput,
    catalogue: SurfaceBootstrap.Catalogue,
    height: "150px"

  alias Surface.Components.Form
  alias SurfaceBootstrap.Catalogue.Form.SampleModel
  alias SurfaceBootstrap.Container

  data changeset, :map,
    default:
      SampleModel.changeset(%SampleModel{}, %{})
      |> Map.put(:action, :insert)

  data props, :map,
    default: %{
      field: :example_04_range,
      label: "Range"
    }

  def render(assigns) do
    ~H"""
    <Container>
      <Form for={{ @changeset }} change="change" submit="submit" opts={{ autocomplete: "off" }}>
        <RangeInput :props={{ @props }} />
      </Form>
    </Container>
    """
  end

  def handle_event("change", %{"sample_model" => changes}, socket) do
    cs =
      SampleModel.changeset(%SampleModel{}, changes)
      |> Map.put(:action, :insert)

    socket = assign(socket, :changeset, cs)
    {:noreply, socket}
  end

  def handle_event(_, _, socket), do: {:noreply, socket}
end
