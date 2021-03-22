import BSN from "bootstrap.native/dist/bootstrap-native.esm.min.js";
let DropDown = {
  mounted() {
    new BSN.Dropdown(this.el.querySelector(".dropdown-toggle"));
  }
};

export { DropDown };