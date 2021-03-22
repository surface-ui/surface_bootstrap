import BSN from "bootstrap.native/dist/bootstrap-native.esm.min.js";
let Modal = {
  mounted() {
    const backdrop = getBackdrop(this.el);
    this.el.oldBackdrop = backdrop;
    this.el.oldFade = this.el.classList.contains("fade");
    new BSN.Modal(this.el, { backdrop: backdrop });

    this.handleEvent(`bsn-show-modal-${this.el.id}`, payload => {
      this.el.Modal.show();
    });

    this.handleEvent(`bsn-hide-modal-${this.el.id}`, payload => {
      this.el.Modal.hide();
    });
  },

  updated() {
    const backdrop = getBackdrop(this.el);
    const fade = this.el.classList.contains("fade");
    if (backdrop != this.el.oldBackdrop || fade != this.el.oldFade) {
      const isShown = this.el.classList.contains("show");
      this.el.oldBackdrop = backdrop;
      this.el.oldFade = fade;
      this.el.Modal.dispose()
      new BSN.Modal(this.el, { backdrop: backdrop });
      if (isShown) {
        this.el.Modal.show();
      }
    }
  },

  destroyed() {
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