// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// Fade Flashes
import "../packs/jquery.raty.js";
import "../packs/ratyrate.js.erb";

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
// require("bootstrap-tagsinput");
require("typeahead.js");

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// Bootstrap4
import "bootstrap";

// Font Awesome
import "@fortawesome/fontawesome-free/js/all";

// Bootstrap Tagsinput
import "../packs/bootstrap-tagsinput.js";

// Fade Flashes
import "../packs/fade_flashes.js";

// Quicksearch
import "../packs/jquery.quicksearch.js";
import "../packs/search_command.by_quicksearch.js";

// Action Text
require("trix");
require("@rails/actiontext");

// import "bootstrap-material-design";


// STYLESHEETS
import "../stylesheets/application";
import "../stylesheets/actiontext";

// IMAGES
const images = require.context("../images/", true);
