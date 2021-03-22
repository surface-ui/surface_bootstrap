defmodule SurfaceBootstrap.Catalogue.Form.Example02 do
  use Surface.Catalogue.Example,
    subject: SurfaceBootstrap.Form,
    catalogue: SurfaceBootstrap.Catalogue,
    title: "Form addons",
    direction: "vertical",
    height: "700px"

  alias SurfaceBootstrap.Form.{
    TextArea,
    TextInput,
    InputGroup,
    InputGroupText
  }

  alias Surface.Components.Form
  alias SurfaceBootstrap.Catalogue.Form.SampleModel

  data changeset, :map,
    default:
      SampleModel.changeset(%SampleModel{}, %{})
      |> Map.put(:action, :insert)

  def render(assigns) do
    ~H"""
    <Form for={{ @changeset }} change="change" submit="submit" opts={{ autocomplete: "off" }}>
      <h4>Basic example</h4>
      <InputGroup>
        <InputGroupText>
          @
        </InputGroupText>
        <TextInput field="example_02_group_1_username" placeholder="Username" />
      </InputGroup>

      <InputGroup>
        <TextInput field="example_02_group_1_recipient_username" placeholder="Recipient's username" />
        <InputGroupText>
          @example.com
        </InputGroupText>
      </InputGroup>

      <InputGroup label="Your vanity URL">
        <InputGroupText>
          https://example.com/users/
        </InputGroupText>
        <TextInput field="example_02_group_1_vanity_url" />
      </InputGroup>

      <InputGroup>
        <InputGroupText>
          $
        </InputGroupText>
        <TextInput field="example_02_group_1_dollars" />
        <InputGroupText>
          .00
        </InputGroupText>
      </InputGroup>

      <InputGroup>
        <TextInput field="example_02_group_1_username_for_server" placeholder="Username" />
        <InputGroupText>
          @
        </InputGroupText>
        <TextInput field="example_02_group_1_server_name" placeholder="Server" />
      </InputGroup>

      <InputGroup>
        <InputGroupText>
          With textarea
        </InputGroupText>
        <TextArea field="example_02_group_1_textarea" />
      </InputGroup>
    </Form>
    """
  end

  def handle_event("change", %{"sample_model" => changes}, socket) do
    cs =
      SampleModel.changeset(%SampleModel{}, changes)
      |> Map.put(:action, :insert)

    socket = assign(socket, :changeset, cs)
    {:noreply, socket}
  end
end
