const { environment } = require("@rails/webpacker");

// Require jQuery and Bootstap javascripts
const webpack = require("webpack");
environment.plugins.prepend(
  "Provide",
  new webpack.ProvidePlugin({
    $: "jquery",
    jQuery: "jquery",
    jquery: "jquery",
    "window.jQuery": "jquery",
    // "jQuery.tagsinput": "bootstrap-tagsinput",
    Popper: "popper.js"
  })
);
module.exports = environment;
