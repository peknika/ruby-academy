/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import "bootstrap"
import ActiveStorageDragAndDrop from 'active_storage_drag_and_drop'

ActiveStorageDragAndDrop.start()

function main() {
    console.log($(".nav-item"))
    $(".mr-auto .nav-item").bind( "click", function(event) {
        event.preventDefault();
        var clickedItem = $( this );
        console.log($(this))
        $( ".nav-item" ).each( function() {
            $( this ).removeClass( "active" );
        });
        clickedItem.addClass( "active" );
    });
}
$(document).ready(main());