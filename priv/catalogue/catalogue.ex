defmodule SurfaceBootstrap.Catalogue do
  @moduledoc """
  Catalogue implementation for SurfaceBootstrap.

  Allows calalogue tools to properly run examples and playgrounds provided
  by this lib.
  """

  use Surface.Catalogue

  # load_asset "assets/bulma.min.css", as: :bulma_css
  # <style>#{@bulma_css}</style>

  @impl true
  def config() do
    [
      head_css: """
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
      <style>
      .phx-no-feedback.invalid-feedback, .phx-no-feedback .invalid-feedback {
        display: none;
      }
      </style>

      """,
      playground: [
        body: [
          style: "padding: 1.5rem; height: 100%;",
          class: "has-background-light"
        ]
      ]
    ]
  end
end
