// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require remark/vendor/modernizr/modernizr
//= require remark/vendor/breakpoints/breakpoints
//
//= require jquery
//= require jquery_ujs
// require turbolinks
//= require retina_tag
//= require jquery.lazyload
//
//= require url_handling
//
//= require foundation/foundation
//= require foundation/foundation.interchange
//
//= require remark/vendor/bootstrap/bootstrap
//= require remark/vendor/asscroll/jquery-asScroll
//= require remark/vendor/mousewheel/jquery.mousewheel
//= require remark/vendor/asscrollable/jquery.asScrollable.all
//= require remark/vendor/ashoverscroll/jquery-asHoverScroll
// require remark/vendor/switchery/switchery
//= require remark/vendor/intro-js/intro
//= require remark/vendor/screenfull/screenfull
//= require remark/vendor/slidepanel/jquery-slidePanel
//
//= require remark/toastr
//= require remark/core
//= require remark/site
//= require remark/sections/menu
//= require remark/sections/menubar
//= require remark/sections/gridmenu
//= require remark/sections/sidebar
//= require remark/configs/config-colors
//= require remark/configs/config-tour
//= require remark/components/asscrollable
//= require remark/components/slidepanel
//= require remark/components/switchery


(function(document, window, $) {
  'use strict';

  Breakpoints();

  var Site = window.Site;
  $(document).ready(function() {
    Site.run();
  });

  $("img.lazy").show().lazyload({ 
    effect : "fadeIn"
  });

  $("#pilot_admin").on("change", function() {
    if ($(this).prop("checked")) {
      $('.section_access').slideUp();
    } else {
      $('.section_access').slideDown();
    }
  });

  $('a[data-toggle=tab]').on('click', function() {
    changeUrlParam('tab', $(this).data('url'));
  });
})(document, window, jQuery);
