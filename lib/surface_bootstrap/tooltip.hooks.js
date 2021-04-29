import BSN from "bootstrap.native/dist/bootstrap-native.esm.min.js";
let Tooltip = {
  mounted() {
    console.log(this.el.dataset);
    const wrapper = this.el.dataset['wrapper'] == "";
    let opts = {};
    if (this.el.dataset['fade']) { opts.animation == "fade"; }
    opts.placement = this.el.dataset['placement'];
    if (this.el.dataset['delay']) { opts.delay = this.el.dataset['delay']; }
    if (this.el.dataset['selector']) { opts.container = this.el.dataset['selector']; }
    console.log(opts);
    if (wrapper) {
      new BSN.Tooltip(this.el, opts);
    } else {
      new BSN.Tooltip(this.el.firstElementChild, opts);
    }
  },


  destroyed() {
    if (this.el.dataset['wrapper']) {
      this.el.firstElementChild.tooltip.dispose();
    } else {
      this.el.Tooltip.dispose();
    }
  }
};


export { Tooltip };