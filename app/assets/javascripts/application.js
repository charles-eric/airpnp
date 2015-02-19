// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .
// app/assets/javascripts/application.js
//= require underscore
//= require gmaps/google



$(document).scroll(function(event){
  if ($(document).scrollTop() > 100) {
    $('.navbar').css('background', ' rgba(255, 255, 255, 0.75)')
  }
  else {
    $('.navbar').css('background', ' rgba(255, 255, 255, 1)')
  }
});

// voir si à supprimer
//alert('Sadly this is static...');