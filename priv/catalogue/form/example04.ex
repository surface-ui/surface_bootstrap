defmodule SurfaceBootstrap.Catalogue.Form.Example04 do
  use Surface.Catalogue.Example,
    subject: SurfaceBootstrap.Form,
    catalogue: SurfaceBootstrap.Catalogue,
    title: "Various form controls",
    direction: "vertical",
    height: "1150px"

  alias SurfaceBootstrap.Form.{
    ColorInput,
    DateInput,
    DateTimeLocalInput,
    FileInput,
    NumberInput,
    PasswordInput,
    RangeInput,
    Select,
    TimeInput,
    TelephoneInput,
    TextInputRightAddon,
    UrlInput
  }

  alias SurfaceBootstrap.{Button, Container}
  alias Surface.Components.{Form}
  alias SurfaceBootstrap.Catalogue.Form.SampleModel

  data(changeset, :map,
    default:
      SampleModel.changeset(%SampleModel{}, %{})
      |> Map.put(:action, :insert)
  )

  def render(assigns) do
    ~H"""
    <Container>
      <Form
        multipart
        for={{ @changeset }}
        change="change"
        submit="submit"
        opts={{ autocomplete: "off" }}
      >
        <DateInput help_field="example_04_date" label="Datetime local" in_group=false />
        <DateTimeLocalInput field="example_04_datetime_local" label="Date" step="3600" />
        <FileInput field="example_04_file" label="File input" />
        <Select
          label="Multiple select"
          field="example_04_multiple_select"
          options={{[
            "Option 1",
            "Option 2",
            "Option 3"
          ]}}
          multiple
          expanded
          rounded
        />
        <NumberInput field="example_04_number" step="5" label="Number with 5 step" />
        <PasswordInput
          field="example_04_password"
          placeholder="Your password"
          icon_left="key"
          label="Password"
        />
        <RangeInput
          field="example_04_range"
          min="0"
          max="10"
          value="7"
          label="Range"
          show_value="right"
        />
        <TelephoneInput label="Telephone input" field="example_04_telephone" />
        <TimeInput label="Time input" field="example_04_time" />
        <UrlInput label="Url input" field="example_04_url" />
        <ColorInput field="example_04_color" label="Color" placeholder="Text input" value="#c33c3c" />
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
