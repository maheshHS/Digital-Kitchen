// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//import 'bootstrap'
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")




// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

$(document).on('turbolinks:load', function () {

    $('form').on('click', '.remove_raw', function (event) {
        $(this).prev('input[type=hidden]').val('true');
        $(this).closest('div').hide();
        return event.preventDefault();
    });

    $('form').on('click', '.add_fields', function (event) {
        var regexp, time;
        time = new Date().getTime();
        regexp = new RegExp($(this).data('id'), 'g');
        $('.fields').append($(this).data('fields').replace(regexp, time));
        return event.preventDefault();
    });

    // $('.converion-actions').on('click', '.add_conversion', function (event) {
    //     time = new Date().getTime();
    //     regexp = new RegExp($(this).data('id'), 'g');
    //     $('.item-body').append($(this).data('fields').replace(regexp, time));
    //     event.preventDefault();
    // });

    $('.modal_remove').click(function (event) {
        $('.conversion_modal_background').removeClass('modal_conv_add');
        event.preventDefault();
    });

    $('.add_cov_btn').click(function (event) {
        $('.conversion_modal_background').addClass('modal_conv_add');
        event.preventDefault();
    });

});


$(function(){
    $("a[rel='tooltip']").tooltip();
})



