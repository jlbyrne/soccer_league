$(document).ready(function() {

	$(".gimmie-json").click(function(e){
		$.get("/", function(response){
			$(".json-container").html(JSON.stringify(response));
		}, "json");
	});
});