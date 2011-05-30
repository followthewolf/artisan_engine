/* DO NOT MODIFY. This file was compiled Wed, 18 May 2011 01:55:09 GMT from
 * /Users/Clarity/Sites/artisan_engine/core/spec/dummy/app/coffeescripts/core.coffee
 */

(function() {
  $(document).ready(function() {
    $('.notification a').live('click', function(e) {
      e.preventDefault();
      return $(this).parents('.notification').slideUp();
    });
    return $('input[value="Delete"]').live('click', function(e) {
      return $(this).parents('form:first').submit(function(ev) {
        var form;
        ev.preventDefault();
        form = $(this);
        return $.fancybox({
          modal: true,
          content: "<div class='confirmation'>											<div class='inner'>												<p>Are you sure?</p>																								<input id='decline' type='button' value='No' /> 												<input id='accept' type='button' value='Yes' />											</div>										</div>",
          onComplete: function() {
            $('#decline').click(function() {
              return $.fancybox.close();
            });
            return $('#accept').click(function() {
              $.rails.handleRemote($(form));
              return $.fancybox.close();
            });
          }
        });
      });
    });
  });
}).call(this);
