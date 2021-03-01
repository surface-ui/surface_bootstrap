// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import "../css/app.scss"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import deps with the dep name or local files with a relative path, for example:
//
//     import {Socket} from "phoenix"
//     import socket from "./socket"
//
import "phoenix_html"
import { Socket } from "phoenix"
import NProgress from "nprogress"
import { LiveSocket } from "phoenix_live_view"

//Import hooks from Surface compiler
import hooks from "./_hooks"

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {
  params: { _csrf_token: csrfToken },
  hooks: hooks,
  dom: {
    onBeforeElUpdated(from, to) {
      if (from.isEqualNode(to)) {
        return false
      }



      if (from.dataset.bsnclass != undefined && from.dataset.bsnclass != "") {
        // console.log("Overriding classlist because bsnclass is true")
        const classes = from.dataset.bsnclass.split(" ");
        classes.forEach(element => {
          if (!to.classList.contains(element)) {
            to.classList.add(element);
          }
        });

      }

      if (from.dataset.bsnstyle == "") {
        // console.log("Overriding style because bsnstyle is true");
        to.setAttribute("style", from.getAttribute("style"));
      }

      return to;
    }
  }
})

// Show progress bar on live navigation and form submits
window.addEventListener("phx:page-loading-start", info => NProgress.start())
window.addEventListener("phx:page-loading-stop", info => NProgress.done())

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket

