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
//= require turbolinks
//= require jquery.validate
//= require jquery.ime
//= require jquery.ime.selector
//= require jquery.ime.preferences
//= require jquery.ime.inputmethods
//= require_tree .


$( document ).ready( function () {
	// Kannada ime enabled for form 
	$( '.kan-ime' ).ime();

// validatin added for book translation form
$("#new_book_translation").validate({
	rules:{

		"book_translation[book_title]":
		{
			required: true
		}
	},
	messages:{
		"book_translation[book_title]":
		{
			required: "ದಯವಿಟ್ಟು ಪದವನ್ನು ಬೆರಳಚ್ಚು ಮಾಡಿ"
		}
	}
});

// validatin added for publisher translation form
$("#new_publisher_translation").validate({
	rules:{

		"publisher_translation[name]":
		{
			required: true
		}
	},
	messages:{
		"publisher_translation[name]":
		{
			required: "ದಯವಿಟ್ಟು ಪದವನ್ನು ಬೆರಳಚ್ಚು ಮಾಡಿ"
		}
	}
});

// validatin added for author translation form
$("#new_author_translation").validate({
	rules:{

		"author_translation[name]":
		{
			required: true
		}
	},
	messages:{
		"author_translation[name]":
		{
			required: "ದಯವಿಟ್ಟು ಪದವನ್ನು ಬೆರಳಚ್ಚು ಮಾಡಿ"
		}
	}
});

});