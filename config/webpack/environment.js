const { environment } = require("@rails/webpacker");

// Require jQuery and Bootstap javascripts
const webpack = require("webpack");
environment.plugins.prepend(
  "Provide",
  new webpack.ProvidePlugin({
    $: "jquery/dist/jquery",
    jQuery: "jquery/dist/jquery",
    jquery: "jquery/dist/jquery",
    Popper: 'popper.js/dist/popper'
  })
);
module.exports = environment;
