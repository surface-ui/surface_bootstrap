defmodule SurfaceBootstrap.Table.Column do
  @moduledoc """
  Defines a column for the parent table component.

  The column instance is automatically added to the table's
  `cols` slot.
  """
  use Surface.Component, slot: "cols"

  @colors ~w(primary secondary success danger warning info light dark)

  @doc "The color of the column"
  prop color, :string, values: @colors

  @doc "Column header text"
  prop label, :string, required: true

  @doc "Footer text"
  prop footer, :string

  @doc """
  Col sizes from https://getbootstrap.com/docs/5.0/layout/columns/
  """
  prop width, :string, values: ~w(1 2 3 4 5 6 7 8 9 10 11 12)

  @doc """
  This prop takes a sort field, the following values are valid:
  - A string that is a valid field on the table
  - A function of arity 1 (uses default sorter)
  - A tuple of {sorter_function/1, compare_function/2}
  All three options are sent as-is to Enum.sort_by/3

  If function it will be used as such:
  ```
  Enum.sort_by(data, sorter_function)
  ```

  Clicking the column again will simply reverse the sort, after
  using the same sorter function whether it is a prop sorter or
  function sorter.

  To do compound sorts based on for example .name and .last_name,
  you would supply a function like this:
  ```
  fn i -> {Map.get(i, :name), Map.get(i, :last_name)} end
  ```
  This would sort the data by first name first, then last name.

  If you need to sort things that do not compare properly with the
  built in `<=` etc, then you can supply a sorter function. For dates
  you would most likely want to supply the following tuple:
  ```
  {fn i -> Map.get(i, :datefield) end, &Date.compare/2}
  ```
  """
  prop sort_by, :any, default: nil
end
