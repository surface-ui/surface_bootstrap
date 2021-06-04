defmodule SurfaceBootstrap.Table do
  @moduledoc """
  A Bootstrap HTML table: https://getbootstrap.com/docs/5.0/content/tables/

  You can create a table by passing `data` to it and defining
  columns using the `Table.Column` component.

  Look in the documentation for `Table.Column` for information on how to do sorting.
  """

  @colors ~w(primary secondary success danger warning info light dark)

  use Surface.LiveComponent
  alias SurfaceBootstrap.Icon, as: Icon

  @doc "The data that populates the table internal"
  prop data, :list, required: true

  @doc "Caption text"
  prop caption, :string

  @doc "Move caption text to the top"
  prop caption_top, :boolean

  @doc "Add borders to all the cells"
  prop bordered, :boolean

  @doc "Make table borderless"
  prop borderless, :boolean

  @doc "Color for borders"
  prop border_color, :string, values: @colors

  @doc "Compact table?"
  prop small, :boolean

  @doc "Add stripes to the table"
  prop striped, :boolean

  @doc "Hoverable rows?"
  prop hover, :boolean

  @doc "Any extra CSS class for the `<table>` element"
  prop class, :css_class, default: []

  @doc "Main table color"
  prop color, :string, values: @colors

  @doc "Table header color"
  prop table_header_color, :string, values: @colors

  @doc "Table footer color (ignored if no footer)"
  prop table_footer_color, :string, values: @colors

  @doc """
  A function that returns a class for the item's underlying `<tr>`
  element. The function receives the item and index related to
  the row. Can be used to set row color ie. "table-dark", "table-success" etc or
  if row is active; "table-active".
  """
  prop row_class, :fun

  @doc "The columns of the table"
  slot cols, props: [item: ^data], required: true

  @doc "Internal holder of sorted data"
  data sorted_data, :list, default: nil

  @doc "Holder of what we're sorting by"
  data sorted_by, :any, default: nil

  @doc "Clicking column again should reverse search"
  data sort_reverse, :boolean, default: false

  def update(assigns, socket) do
    socket = assign(socket, assigns)
    socket = assign(socket, :sorted_data, sorted_data(socket.assigns))

    cols_with_index =
      Enum.with_index(socket.assigns.cols || [])
      |> Enum.reduce([], fn {col, index}, acc ->
        [Map.put(col, :index, index) | acc]
      end)
      |> Enum.reverse()

    socket = assign(socket, :cols, cols_with_index)

    {:ok, socket}
  end

  defp sorted_data(assigns) do
    cond do
      !is_nil(assigns.sorted_by) ->
        sorted_data =
          case assigns.sorted_by do
            sorter when is_binary(sorter) ->
              # We have to try to fetch both by string and atom key as
              # we don't know if the data is using string or atom keys.
              Enum.sort_by(assigns.data, fn i ->
                Map.get(i, sorter) ||
                  Map.get(i, String.to_atom(sorter))
                  |> case do
                    sorted_field when is_binary(sorted_field) ->
                      String.downcase(sorted_field)

                    sorted_field ->
                      sorted_field
                  end
              end)

            sorter when is_function(sorter) ->
              Enum.sort_by(assigns.data, sorter)

            {sorter, comparer} when is_function(sorter) and is_function(comparer) ->
              Enum.sort_by(assigns.data, sorter, comparer)
          end

        sorted_data =
          if assigns.sort_reverse == true do
            Enum.reverse(sorted_data)
          else
            sorted_data
          end

        sorted_data

      true ->
        assigns.data
    end
  end

  # defp data_equal(data, sorted_data) do
  #   MapSet.equal?(MapSet.new(data || []), MapSet.new(sorted_data || []))
  # end

  # defp do_sort(assigns) do

  # end

  def render(assigns) do
    ~H"""
    <table class={{[
      "table",
      "table-striped": @striped,
      "table-#{@color}": @color,
      "table-striped": @striped,
      "table-hover": @hover,
      "table-bordered": @bordered,
      "table-borderless": @borderless,
      "border-#{@border_color}": @border_color,
      "table-sm": @small
    ] ++ @class}}>
      <caption :if={{ @caption }} class={{ "caption-top": @caption_top }}>
        {{ @caption }}
      </caption>
      <thead class={{ "table-#{@table_header_color}": @table_header_color }}>
        <tr>
          <For each={{ col <- @cols }}>
            <th scope="col" class={{ width_class(col) }}>
              <If condition={{ !is_nil(col.sort_by) && assigns.sorted_by == col.sort_by }}>
                <a :on-click="sorted_click" phx-value-value={{ col.index }} >
                  {{ col.label }}
                  <Icon icon={{ if assigns.sort_reverse, do: "caret-up-fill", else: "caret-down-fill" }} />
                </a>
              </If>
              <If condition={{ !is_nil(col.sort_by) && assigns.sorted_by != col.sort_by }}>
                <a :on-click="sorted_click" phx-value-value={{ col.index }} >
                  {{ col.label }}
                </a>
              </If>
              <If condition={{ is_nil(col.sort_by) }}>
                {{ col.label }}
              </If>
            </th>
          </For>
        </tr>
      </thead>
      <tbody>
        <tr
          :for={{ {item, index} <- Enum.with_index(@sorted_data) }}
          class={{ row_class_fun(@row_class).(item, index) }}
        >
          <For each={{ {_col, index} <- Enum.with_index(@cols) }}>
            <If condition={{ index == 0 }}>
              <th scope="row">
                <slot name="cols" index={{ index }} :props={{ item: item }} />
              </th>
            </If>
            <If condition={{ index > 0 }}>
              <td>
                <slot name="cols" index={{ index }} :props={{ item: item }} />
              </td>
            </If>
          </For>
        </tr>
      </tbody>
      <tfoot
        :if={{ has_footers?(@cols) }}
        class={{ "table-#{@table_footer_color}": @table_footer_color }}
      >
        <tr>
          <For each={{ col <- @cols }}>
            <td>{{ col.footer }}</td>
          </For>
        </tr>
      </tfoot>
    </table>
    """
  end

  defp width_class(col) do
    case col do
      %{width: num} when not is_nil(num) ->
        case parse_value(num) do
          parsed when parsed >= 0 and parsed <= 12 ->
            "col-#{num}"

          _ ->
            []
        end

      _ ->
        []
    end
  end

  defp parse_value(num) when is_integer(num), do: num

  defp parse_value(num) when is_binary(num) do
    Integer.parse(num)
    |> case do
      {num, _} ->
        num

      _ ->
        -1
    end
  end

  defp has_footers?(cols) do
    Enum.any?(cols, fn col ->
      !is_nil(Map.get(col, :footer))
    end)
  end

  def handle_event(
        "sorted_click",
        %{"value" => col_index},
        socket = %{assigns: %{sorted_by: sorted_by, sort_reverse: sort_reverse, cols: cols}}
      ) do
    {col_index, _} = Integer.parse(col_index)
    sort_by_new = Enum.at(cols, col_index).sort_by

    socket =
      cond do
        sorted_by != sort_by_new ->
          assign(socket, :sorted_by, sort_by_new)
          |> assign(:sort_reverse, false)

        sorted_by == sort_by_new ->
          assign(socket, :sort_reverse, !sort_reverse)
      end

    socket = assign(socket, :sorted_data, sorted_data(socket.assigns))
    {:noreply, socket}
  end

  defp row_class_fun(nil), do: fn _, _ -> "" end
  defp row_class_fun(row_class), do: row_class
end
