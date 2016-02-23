// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
//
//= require jquery/jquery-2.1.1.js
//= require jquery_ujs
//= require bootstrap-sprockets
//= require metisMenu/jquery.metisMenu.js
//= require pace/pace.min.js
//= require peity/jquery.peity.min.js
//= require slimscroll/jquery.slimscroll.min.js
//= require jquery-cookie/jquery.cookie.js
//= require select2/select2.full.min.js
//= require chosen/chosen.jquery.js
//= require toastr/toastr.min.js
//= require inspinia.js
//= require url_handling
//= require retina_tag

$(function() {
  // Change the url when clicking a tab.
  $('a[data-toggle=tab]').on('click', function() {
    changeUrlParam('tab', $(this).data('url'));
  });

  // Set the button tooltip.
  $('.btn-tooltip').tooltip({ container: "body" });
});
