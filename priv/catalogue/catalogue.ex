defmodule SurfaceBootstrap.Catalogue do
  @moduledoc """
  Catalogue implementation for SurfaceBootstrap.

  Allows calalogue tools to properly run examples and playgrounds provided
  by this lib.
  """

  use Surface.Catalogue

  load_asset("assets/js/app.js", as: :app_js)
  load_asset("assets/css/app.css", as: :app_css)

  @impl true
  def config() do
    [
      head_css: """
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap.native@3.0.14-f/dist/bootstrap-native.min.js"></script>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
      <style>#{@app_css}</style>
      <script> #{@app_js}</script>
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
