if (typeof jQuery !== 'undefined') {
    (function ($) {
        $('#spinner').ajaxStart(function () {
            $(this).fadeIn();
        }).ajaxStop(function () {
                $(this).fadeOut();
            });
    })(jQuery);

    $(document).ready(function (e) {
        // Check if there's a message
        if ($('.alert').length) {
            // If mouse is clicked, moved or a key is pressed
            $(document).one('click mousemove keypress', function (e) {
                // Fade the message away after 500 ms
                $('.alert').animate({ opacity: 1.0 }, 500).fadeOut();
            });
        }
    });
}
