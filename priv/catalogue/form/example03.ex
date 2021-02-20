defmodule SurfaceBootstrap.Catalogue.Form.Example03 do
  use Surface.Catalogue.Example,
    subject: SurfaceBootstrap.Form,
    catalogue: SurfaceBootstrap.Catalogue,
    title: "Horizontal form groups",
    height: "500px",
    direction: "vertical"

  alias SurfaceBootstrap.Form.{
    EmailInput,
    FieldWrapper,
    InputGroup,
    RadioButton,
    Select,
    # TelephoneInput,
    TextArea,
    TextInput
  }

  alias SurfaceBootstrap.{Button, ButtonGroup, Title}
  alias Surface.Components.{Link, Form}
  alias SurfaceBootstrap.Catalogue.Form.SampleModel

  data changeset, :map,
    default:
      SampleModel.changeset(%SampleModel{}, %{})
      |> Map.put(:action, :insert)

  def render(assigns) do
    ~H"""
    <Form for={{ @changeset }} change="change" submit="submit" opts={{ autocomplete: "off" }}>
      <InputGroup label="From">
        <TextInput
          label="This label is ignored"
          class="col-auto"
          field="example_03_name"
          placeholder="Name"
          icon_left="user"
        />
        <TextInput class="col-auto" field="example_03_email" value="alex@smith.com" />
      </InputGroup>
      <InputGroup>
        <TextInput field="example_03_phone" placeholder="Your phone number" />
      </InputGroup>
      <InputGroup label="Department">
        <Select
          field="example_03_department"
          placeholder="Name"
          options={{[
            "Business development",
            "Marketing",
            "Sales"
          ]}}
        />
      </InputGroup>
      <InputGroup label="Already a member?">
        <RadioButton field="example_03_member" options={{ ["yes", "no"] }} />
      </InputGroup>
      <InputGroup label="Subject">
        <TextInput field="example_03_subject" placeholder="e.g. Partnership opportunity" />
      </InputGroup>
      <InputGroup label="Question">
        <TextArea field="example_03_question" placeholder="Explain how we can help you" />
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
