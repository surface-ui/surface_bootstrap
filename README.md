# SurfaceBootstrap

A set of simple [Surface](https://github.com/surface-ui/surface/) components
based on [Bootstrap](https://getbootstrap.com/docs/5.0/getting-started/introduction/).

Hex.pm: [Here](https://hex.pm/packages/surface_bootstrap)


## Components

  * All Form Inputs
  * ButtonGroup
  * Button
  * Card
  * Container
  * DropDown (requires Bootstrap Native JS)
  * Icon
  * Modal (requires Bootstrap Native JS)
  * NavBar
  * Table
  * Table.Column
  * Tabs

## Example

```jsx
<Table id="foo" data={{ person <- @persons }}>
  <Column width="2" label="Id" sort_by="id">
    {{ person.id }}
  </Column>
  <Column width="10" label="Name" sort_by="name">
    {{ person.name }}
  </Column>
</Table>
```

## Usage

Add `surface_bootstrap` to the list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    ...
    {:surface_bootstrap, "~> 0.1.0"}
  ]
end
```

The components self-register hooks and compile to folder `_hooks/`.
This location is configureable through for example: `config :surface, :compiler, hooks_output_dir: "assets/js/surface"`.


### Javascript component hooks
The hooks are for the "(requires Bootstrap Native JS)" marked components above.
If you do not want to use Modal or DropDown, simply skip this section.
1. Start by adding `"bootstrap.native": "^3.0.14-f",` to dependencies in `package.json` in `assets/`
2. Then do the following somewhere in your `app.js` 
```
//Import hooks from Surface compiler
import hooks from "./_hooks"
```
3. Configure your LiveSocket as such:
```
let liveSocket = new LiveSocket("/live", Socket, {
  params: { _csrf_token: csrfToken },
  hooks: hooks,
  dom: {
    onBeforeElUpdated(from, to) {
      if (from.isEqualNode(to)) {
        return false
      }

      if (from.dataset.bsnclass != undefined && from.dataset.bsnclass != "") {
        const classes = from.dataset.bsnclass.split(" ");
        classes.forEach(element => {
          if (!to.classList.contains(element)) {
            to.classList.add(element);
          }
        });

      }
      if (from.dataset.bsnstyle == "") {
        to.setAttribute("style", from.getAttribute("style"));
      }
      return to;
    }
  }
})
```

If you have hooks from before, remember to merge the hooks object from Surface with your own hooks before assigning to socket. Also add your own morphdom changes as needed, but remember to `return to;` so the changes are saved.


To use Bootstraps's CSS styles, choose one of the following methods:

### 1. Using CDN or downloading files

Add the following line to your `layout_view.ex`:

```
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
```

Or download the `.css` file and manually add it to your `priv/static/css` folder.
In this case, add the following line to your `layout_view.ex`:

```
<link rel="stylesheet" href={{ Routes.static_path(@conn, "/css/bootstrap.min.css") }} />
```

You can download the css from here: https://getbootstrap.com/docs/5.0/getting-started/download/

### 2. NPM or Yarn

Add `bootstrap` to the list of dependencies in `assets/package.json`:

```
"dependencies": {
  ...
  "bootstrap": "5.0.0-beta3"
}
```

## License

Copyright (c) 2020, Oliver Mulelid-Tynes.

SurfaceBootstrap source code is licensed under the [MIT License](LICENSE.md).