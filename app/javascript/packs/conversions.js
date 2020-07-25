$('.edit_cov_btn').click(function (event) {
    // $('.conversion_modal_background2').addClass('modal_conv_add2');
    $('.modal_remove2').addClass('modal_conv_add2');
    $("#conv_modal_" + this.id).addClass('modal_conv_add2');
    event.preventDefault();
});

$('.modal_remove2').click(function (event) {
    $('.conversion_modal_background2').removeClass('modal_conv_add2');
    $('.modal_remove2').removeClass('modal_conv_add2');
    event.preventDefault();
});