// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
require("@rails/ujs").start()
//require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
var jQuery = require("jquery")
// import jQuery from "jquery";
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;
require('bootstrap')
require('datatables.net-bs4')