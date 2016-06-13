// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
// require turbolinks
//= require jquery.validate
//= require highcharts
//= require jquery.ime
//= require jquery.ime.selector
//= require jquery.ime.preferences
//= require jquery.ime.inputmethods
//= require twitter/typeahead
//= require twitter/typeahead.min
//= require jquery.purr
//= require best_in_place
//= require_tree .


$( document ).ready( function () {
	// Kannada ime enabled for form 
	$( '.kan-ime' ).ime();

	/* Activating Best In Place */
	jQuery(".best_in_place").best_in_place();

	// // validatin added for book info form
	// $(".book-info-form").validate({
	// 	rules:{

	// 		"others[edition]":
	// 		{
	// 			required: true
	// 		}
	// 	},
	// 	messages:{
	// 		"others[edition]":
	// 		{
	// 			required: "ದಯವಿಟ್ಟು ಪದವನ್ನು ಬೆರಳಚ್ಚು ಮಾಡಿ"
	// 		}
	// 	}
	// });

});