import BSN from "bootstrap.native/dist/bootstrap-native.esm.min.js";
let Modal = {
  mounted() {
    const backdrop = getBackdrop(this.el);
    new BSN.Modal(this.el, { backdrop: backdrop });
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