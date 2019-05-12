/**
 * 
 */

$(function(){
	console.log("~~~~~~~~~~");
	$("#search_input").bind('input oninput',  function(){
		$.get("autocomplete", function(back){
			var availableInfo = back.substring(1).split("-");
			$("#search_input").autocomplete({
				source:availableInfo
			});
		});
	});





})
