defmodule SurfaceBootstrap.Catalogue.Form.SampleModel do
  use Ecto.Schema
  import Ecto.Changeset

  schema "" do
    field(:example_01_name, :string)
    field(:example_01_username, :string)
    field(:example_01_email, :string)
    field(:example_01_select, :string)
    field(:example_01_textarea, :string)
    field(:example_01_checkbox, :boolean)
    field :example_01_checkbox_switch, :boolean
    field :example_01_checbox_inline_01, :boolean
    field :example_01_checbox_inline_02, :boolean
    field :example_01_checbox_inline_03, :boolean
    field(:example_01_radio, :string)

    field(:example_02_group_1_username, :string)
    field(:example_02_group_1_recipient_username, :string)
    field(:example_02_group_1_vanity_url, :string)
    field(:example_02_group_1_dollars, :string)
    field(:example_02_group_1_username_for_server, :string)
    field(:example_02_group_1_server_name, :string)
    field(:example_02_group_1_textarea, :string)

    field :example_03_name, :string
    field :example_03_email, :string
    field :example_03_phone, :string
    field :example_03_department, :string
    field :example_03_member, :boolean
    field :example_03_subject, :string
    field :example_03_question, :string

    field :example_04_color, :string
    field :example_04_date, :date
    field :example_04_date_select, :date
    field :example_04_datetime_local, :utc_datetime
    field :example_04_datetime_select, :utc_datetime
    field :example_04_email, :string
    # will just hold filename
    field :example_04_file, :string
    field :example_04_multiple_select, {:array, :string}
    field :example_04_number, :integer
    field :example_04_password, :string
    field :example_04_telephone, :string
    field :example_04_time, :time
    field :example_04_url, :string
  end

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [
      :example_01_name,
      :example_01_username,
      :example_01_email,
      :example_01_select,
      :example_01_textarea,
      :example_01_checkbox,
      :example_01_checkbox_switch,
      :example_01_checbox_inline_01,
      :example_01_checbox_inline_02,
      :example_01_checbox_inline_03,
      :example_01_radio,
      :example_02_group_1_username,
      :example_02_group_1_recipient_username,
      :example_02_group_1_vanity_url,
      :example_02_group_1_dollars,
      :example_02_group_1_username_for_server,
      :example_02_group_1_server_name,
      :example_02_group_1_textarea,
      :example_03_name,
      :example_03_email,
      :example_03_phone,
      :example_03_department,
      :example_03_member,
      :example_03_subject,
      :example_03_question,
      :example_04_color,
      :example_04_date,
      :example_04_date_select,
      :example_04_datetime_local,
      :example_04_datetime_select,
      :example_04_email,
      :example_04_file,
      :example_04_multiple_select,
      :example_04_number,
      :example_04_password,
      :example_04_telephone,
      :example_04_time,
      :example_04_url
    ])
    |> validate_required([:example_01_name, :example_03_subject])
    |> validate_format(:example_01_email, email_regex(), message: "This email is invalid")
  end

  defp email_regex,
    do:
      ~r/(?:[a-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+\/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/
end
