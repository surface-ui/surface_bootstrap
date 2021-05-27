defmodule SurfaceBootstrap.Catalogue.Form.Example01 do
  use Surface.Catalogue.Example,
    subject: SurfaceBootstrap.Form,
    catalogue: SurfaceBootstrap.Catalogue,
    title: "Sample form",
    direction: "vertical",
    height: "900px"

  alias SurfaceBootstrap.Form.{
    Checkbox,
    EmailInput,
    InputGroup,
    RadioButton,
    Select,
    TextArea,
    TextInput
  }

  alias SurfaceBootstrap.{Button, Container}
  alias Surface.Components.{Link, Form}
  alias SurfaceBootstrap.Catalogue.Form.SampleModel

  data changeset, :map,
    default:
      SampleModel.changeset(%SampleModel{}, %{})
      |> Map.put(:action, :insert)

  def render(assigns) do
    ~H"""
    <Container>
      <Form for={{ @changeset }} change="change" submit="submit" opts={{ autocomplete: "off" }}>
        <TextInput floating_label field={{ :example_01_name }} label="Name" placeholder="Text input" />
        <TextInput field={{ :example_01_username }} label="Username" placeholder="Username" />
        <EmailInput field={{ :example_01_email }} label="Email" />
        <Select
          label="Floating label in select"
          floating_label
          field={{ :example_01_select }}
          options={{[
            "Select dropdown",
            "with options"
          ]}}
        />
        <TextArea field={{ :example_01_textarea }} label="Message" placeholder="Textarea" size="normal" />
        <InputGroup label="Regular checkbox with rich content">
          <Checkbox field={{ :example_01_checkbox }}>
            I agree to the
            <Link to="#">terms and conditions</Link>
          </Checkbox>
        </InputGroup>

        <InputGroup label="Switches">
          <Checkbox switch field={{ :example_01_checkbox_switch }}>
            Switched checkbox
          </Checkbox>
        </InputGroup>
        <InputGroup label="Inline checkboxes">
          <Checkbox inline field={{ :example_01_checbox_inline_01 }}>
            One
          </Checkbox>

          <Checkbox inline field={{ :example_01_checbox_inline_02 }}>
            Two
          </Checkbox>
          <Checkbox switch inline field={{ :example_01_checbox_inline_03 }}>
            Three
          </Checkbox>
        </InputGroup>
        <InputGroup label="Inline radio buttons">
          <RadioButton inline field={{ :example_01_radio }} options={{ ["yes", "no"] }} />
        </InputGroup>
        <Button class="btn mt-3" type="submit" color="primary">
          Submit
        </Button>
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
end
