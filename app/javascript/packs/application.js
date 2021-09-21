// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
// top of packs/application.js
const importAll = (r) => r.keys().map(r)
importAll(require.context('../images', false, /\.(png|jpe?g|svg)$/));



require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("jquery")
require("bootstrap")
require("@fortawesome/fontawesome-free")
import "channels"
import "../stylesheets/application";
import "../stylesheets/main";
import "../stylesheets/sidenav";
import "bootstrap/js/src/scrollspy"
import "../stylesheets/w3";
document.addEventListener("turbolinks:load", function() {
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
        $('[data-toggle="popover"]').popover()
    })
})
