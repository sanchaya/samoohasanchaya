$( document ).ready( function () {
// validatin added for book translation form
$("#new_dli_book_translation").validate({
	rules:{

		"dli_book_translation[book_title]":
		{
			required: true
		}
	},
	messages:{
		"dli_book_translation[book_title]":
		{
			required: "ದಯವಿಟ್ಟು ಪದವನ್ನು ಬೆರಳಚ್ಚು ಮಾಡಿ"
		}
	}
});

// validatin added for publisher translation form
$("#new_dli_publisher_translation").validate({
	rules:{

		"dli_publisher_translation[name]":
		{
			required: true
		}
	},
	messages:{
		"dli_publisher_translation[name]":
		{
			required: "ದಯವಿಟ್ಟು ಪದವನ್ನು ಬೆರಳಚ್ಚು ಮಾಡಿ"
		}
	}
});

// validatin added for author translation form
$("#new_dli_author_translation").validate({
	rules:{

		"dli_author_translation[name]":
		{
			required: true
		}
	},
	messages:{
		"dli_author_translation[name]":
		{
			required: "ದಯವಿಟ್ಟು ಪದವನ್ನು ಬೆರಳಚ್ಚು ಮಾಡಿ"
		}
	}
});

});