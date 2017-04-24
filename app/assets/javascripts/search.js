
var search = function() {
    $("#search-bar").keyup(function(event) {
		if (!event.shiftKey) {
			$.get('/users/search', {search: $(this).val()}, function(data) {
		 		$("#users").html(data);
			});
		}
	});
}
$(document).on('turbolinks:load', search);
