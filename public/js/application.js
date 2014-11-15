$(document).ready(function() {
	$(".login_link").click(function(event){
		event.preventDefault();
		$(".login").fadeToggle("slow", "linear");
	});

	$(".signup_link").click(function(event){
		event.preventDefault();
		$(".signup").fadeToggle("slow", "linear");
	});

	$(".login").on('submit', '#log-in', function(event){
		// event.preventDefault();
		$(".error_msg").fadeToggle("slow", "linear");
	});

	$(".reply_link").click(function(event){
		event.preventDefault();
		$(".reply_box").fadeToggle("slow", "linear");
		$(".reply_link").toggle("vertical");
	});

	$('#reply_form').on('submit', '.reply_box', function(event) {
	    event.preventDefault();
	    $form = $(event.target);
	    
	    $.ajax({
	      type: $form.attr('method'),
	      url: $form.attr('action'),
	      data: $form.serialize()
	    }).done(function(response) {
	      $("#reply_container").append("<p class='reply'>" + response + "</p>")
		});
	});
});

