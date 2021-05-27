import BSN from "bootstrap.native/dist/bootstrap-native.esm.min.js";
let Tooltip = {
  mounted() {
    this.el.querySelectorAll('[data-bs-toggle]').forEach(element => {
      const opts = getOpts(element.dataset || {});
      new BSN.Tooltip(element, opts);
    });

  }
};

let Hook = {
  mounted() {
    new BSN.Tooltip(this.el);
  }
}

export { Tooltip, Hook };


const getOpts = (dataset) => {
  let opts = {};
  console.log(dataset);

  [
    'animation',
    'customClass',
    'placement',
    'delay',
    'container'
  ].forEach(key => {
    if (dataset['bs' + capitalize(key)]) {
      opts[key] = dataset['bs' + capitalize(key)];
    }
  });

  console.log(opts);
  return opts;
};

const capitalize = (string) => (string.charAt(0).toUpperCase() + string.slice(1));
