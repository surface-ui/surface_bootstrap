import BSN from "bootstrap.native/dist/bootstrap-native.esm.min.js";
let Collapse = {
  mounted() {
    new BSN.Collapse(this.el);
  },


  destroyed() {
    this.el.Collapse.dispose();
  }
};


export { Collapse };