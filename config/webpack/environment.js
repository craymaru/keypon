const { environment } = require("@rails/webpacker");
const merge = require("webpack-merge");

// Require jQuery and Bootstap javascripts
const webpack = require("webpack");
environment.plugins.prepend(
  "Provide",
  new webpack.ProvidePlugin({
    $: "jquery",
    jQuery: "jquery",
    jquery: "jquery",
    "window.jQuery": "jquery",
    Popper: ["popper.js", "default"] // for Bootstrap 4
  })
);

const envConfig = (module.exports = environment);
const aliasConfig = (module.exports = {
  resolve: {
    alias: {
      jquery: "jquery/src/jquery"
    }
  }
});

module.exports = merge(envConfig.toWebpackConfig(), aliasConfig);
