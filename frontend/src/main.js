
jQuery('.form-nav-control').click(function() {
    if (jQuery(this).siblings('ul').is(":visible")) {
        jQuery(this).siblings('ul').slideUp(function() {
            jQuery(this).removeAttr('style').addClass('invisivel').removeClass('visivel');
        });
    } else {
        jQuery(this).siblings('ul').slideDown(function() {
            jQuery(this).removeAttr('style').addClass('visivel').removeClass('invisivel');
        });
    }
});
fontSize = 100;
fontSizeMax = 200;
fontSizeMin = 80;

jQuery('.glyphicon').click(function() {
    if (jQuery(this).hasClass('fonte-maior') && fontSize < fontSizeMax) {
        fontSize = fontSize + 20;
        jQuery('body').css('font-size', fontSize + "%");
    } else if (jQuery(this).hasClass('fonte-menor') && fontSize > fontSizeMin) {
        fontSize = fontSize - 20;
        jQuery('body').css('font-size', fontSize + "%");
        
    }
    console.log(jQuery('body').css('font-size'));
});


jQuery('.inner-panel-toggle').click(function() {
    $innerToggle = jQuery(this).parent('div').find('.inner-panel-info');
    if ($innerToggle.is(':visible')) {
        $innerToggle.slideUp();
        $(this).html('Expandir <i class="glyphicon glyphicon-chevron-down"></i>');
    } else {
        $innerToggle.slideDown();
        $(this).html('Esconder <i class="glyphicon glyphicon-chevron-up"></i>');
    }
    return false;
});

//jQuery('.has-tooltip').tooltip();