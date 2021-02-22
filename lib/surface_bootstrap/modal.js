import BSN from "bootstrap.native/dist/bootstrap-native.esm.min.js";
let Modal = {
  mounted() {

    this.el.backdrop = getBackdrop(this.el);

    let show = this.el.dataset.show;
    let modal = new BSN.Modal(this.el, { backdrop: this.el.backdrop });

    if (show == "" || show == "static") {
      this.el.Modal.show();
    }

    let hookThis = this;
    this.el.pushHideEvents = true;
    this.handleEvent(`bootstrap-modal-hide-${hookThis.el.id}`, (function (params) {
      console.log("Got hide from server event!");
      hookThis.el.Modal.hide();
    }));
    this.el.addEventListener('hide.bs.modal', function (event) {
      if (hookThis.el.pushHideEvents) {
        hookThis.pushEvent(`bootstrap-modal-hide`, { id: hookThis.el.id });
      }

      hookThis.el.hiddenFromServer = false;

    }, false);
  },
  updated() {
    let backdrop = getBackdrop(this.el);
    if (backdrop != this.el.backdrop) {
      // console.log("Backdrop changed, disposing and recreating modal!");
      this.el.pushHideEvents = false;
      this.el.backdrop = backdrop;
      this.el.Modal.dispose();
      new BSN.Modal(this.el, { backdrop: this.el.backdrop });
      this.el.pushHideEvents = true;
    }
    let show = this.el.dataset.show;
    if (show == "" || show == "static") {
      this.el.Modal.show();
    }
  },

  destroyed() {
    this.el.pushHideEvents = false;
    this.el.Modal.dispose();
  }
};

function getBackdrop(element) {
  if (element.dataset.backdrop == 'static') {
    return 'static';
  }
  if (element.dataset.backdrop == "") {
    return true;
  }
  return undefined;
};

export { Modal };