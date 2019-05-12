$(function(){
	var color = "none";
	var gender = "none";
	var brand = "none";
	var cur_page = 1;
	
		$("#search_input").bind('input oninput',  function(){
			console.log("~~~~~~~~~~~~");
			$.get("autocomplete", function(back){
				var availableInfo = back.substring(1).split("-");
				$("#search_input").autocomplete({
					source:availableInfo
					
				});
			});
		});



       $("#search_input").keyup(function(event){
    	   console.log("key'action");
//    	   return false;
    	   if(event.keyCode === 13){
    		   var inputName = $(this).val();
    		   console.log("input is "+inputName);
    		   $.get("filtername?inputName="+inputName, function(back){
    			   console.log("in js back is " + back);
    			   back = back.substring(1);//the call back func's para is a string with all information divide by "-", ","
    			   console.log("after kill first bit : "+ back);
    			   if(back.length == 0){
    				   $("#matchinfo").text("No Match Item!!!");
				
    			   }
    			   else{
    				   $("#matchinfo").empty();
    			   }
    			   
			
//			alert("back.size  " + back.length);
    			   let backsize = back.length;          //record the length of back ,if 0 means no shoes find
    			   var items = back.split("-");       //divide string to string array, each elemnt in arry is a shoes info with(name, price ,locaiton)
			
				
				let index = (cur_page-1)*6;
				
				console.log("callback");
				 console.log("shoes number: "+ items.length);
				console.log("index is: "+ index);
				
				//forloop fill the element in jsp
				for(let i = 1; i <= 6; i++){
					(function(i){
						if(backsize != 0 && index - 1 + i < items.length){
							var oneitem = items[index-1+i];
							console.log(oneitem);
							var columns = oneitem.split(",");    //seperate one stirng to name, price location
							$("#img"+i).attr("src", `${columns[1]}`);
							console.log("1" + columns[1]);
							$("#name"+i).text(columns[0]);
							console.log("0" + columns[0]);
							$("#price"+i).text(columns[2]);
							console.log("2" + columns[2]);
							$("#a"+i).attr("href", "detail?name="+ columns[0]);
	//						index ++;
						}else{
							$("#img"+i).attr("src", "./img/none.png");
							$("#name"+i).text("");
							$("#price"+i).text("");
							
						}
						
					}(i));
					
				}
			
	    		   })
    	   } 
    	  
       })
	
	
	
	
	//first render , when the window load do it fill the picture, name, price, and href address
	$.get("itemfilter?gender="+gender+"&color="+color+"&brand="+brand, function(back){
		back = back.substring(1);//the call back func's para is a string with all information divide by "-", ","
		
		if(back.length == 0){
			$("#matchinfo").text("No Match Item!!!");
			
		}
		else{
			$("#matchinfo").empty();
		}
		
//		alert("back.size  " + back.length);
		let backsize = back.length;          //record the length of back ,if 0 means no shoes find
		var items = back.split("-");       //divide string to string array, each elemnt in arry is a shoes info with(name, price ,locaiton)
		
		
		let index = (cur_page-1)*6;
		
		
		//forloop fill the element in jsp
		for(let i = 1; i <= 6; i++){
			(function(i){
				if(backsize != 0 && index - 1 + i < items.length){
					var oneitem = items[index-1+i];
					var columns = oneitem.split(",");    //seperate one stirng to name, price location
					$("#img"+i).attr("src", `${columns[1]}`);
					$("#name"+i).text(columns[0]);
					$("#price"+i).text(columns[2]);
					$("#a"+i).attr("href", "detail?name="+ columns[0]);
				}else{
					$("#img"+i).attr("src", "./img/none.png");
					$("#name"+i).text("");
					$("#price"+i).text("");
					
				}
				
			}(i));
			
		}
	})
	
	//listener the page number bar 
	$(".pagenum").click(function(){
		
		cur_page = $(this).text();
		color = $("input:radio[name='color']:checked").val();
		gender = $("input:radio[name='gender']:checked").val();
		brand = $("input:radio[name='brand']:checked").val();
		$.get("itemfilter?gender="+gender+"&color="+color+"&brand="+brand, function(back){
			back = back.substring(1);//the call back func's para is a string with all information divide by "-", ","
			
			
//			alert("back.size  " + back.length);
			let backsize = back.length;          //record the length of back ,if 0 means no shoes find
			var items = back.split("-");       //divide string to string array, each elemnt in arry is a shoes info with(name, price ,locaiton)
			if(back.length == 0){
				$("#matchinfo").text("No Match Item!!!");
				
			}
			else{
				$("#matchinfo").empty();
			}
			//find index by page, 6 picture one page
			let index = (cur_page-1)*6;
			
			//forloop fill the element in jsp
			for(let i = 1; i <= 6; i++){
				(function(i){
					if(backsize != 0 && index - 1 + i < items.length){
						var oneitem = items[index-1+i];
						console.log(oneitem);
						var columns = oneitem.split(",");    //seperate one stirng to name, price location
						$("#img"+i).attr("src", `${columns[1]}`);
						$("#name"+i).text(columns[0]);
						$("#price"+i).text(columns[2]);
						$("#a"+i).attr("href", "detail?name="+ columns[0]);
					}else{
						$("#img"+i).attr("src", "./img/none.png");
						$("#name"+i).text("");
						$("#price"+i).text("");
						
						
					}
					
				}(i));
				
			}
		})
		return false;
	})
		
	
	//listener brand contains conditino
	$( "input:radio[name='brand']").change(function(){
		color = $("input:radio[name='color']:checked").val();
		gender = $("input:radio[name='gender']:checked").val();
		brand = $(this).val();
		
		$.get("itemfilter?gender="+gender+"&color="+color+"&brand="+brand, function(back){
			back = back.substring(1);//the call back func's para is a string with all information divide by "-", ","
			if(back.length == 0){
				$("#matchinfo").text("No Match Item!!!");
				
			}
			else{
				$("#matchinfo").empty();
			}
			
//			alert("back.size  " + back.length);
			let backsize = back.length;          //record the length of back ,if 0 means no shoes find
			var items = back.split("-");       //divide string to string array, each elemnt in arry is a shoes info with(name, price ,locaiton)
			
			
			let index = (cur_page-1)*6;
			
			//forloop fill the element in jsp
			for(let i = 1; i <= 6; i++){
				(function(i){
					if(backsize != 0 && index - 1 + i < items.length){
						var oneitem = items[index-1+i];
						var columns = oneitem.split(",");    //seperate one stirng to name, price location
						$("#img"+i).attr("src", `${columns[1]}`);
						$("#name"+i).text(columns[0]);
						$("#price"+i).text(columns[2]);
						$("#a"+i).attr("href", "detail?name="+ columns[0]);
					}else{
						$("#img"+i).attr("src", "./img/none.png");
						$("#name"+i).text("");
						$("#price"+i).text("");
						
					}
					
				}(i));
				
			}
		})
	})
	
	//listener gender conditino
	$("input:radio[name='gender']").change(function(){
		color = $("input:radio[name='color']:checked").val();
		brand = $("input:radio[name='brand']:checked").val();
		gender = $(this).val();
		
		$.get("itemfilter?gender="+gender+"&color="+color+"&brand="+brand, function(back){
			back = back.substring(1);
			if(back.length == 0){
				$("#matchinfo").text("No Match Item!!!");
				
			}
			else{
				$("#matchinfo").empty();
			}
			let backsize = back.length;          //record the length of back ,if 0 means no shoes find
			var items = back.split("-");
			
			let index = (cur_page-1)*6;
			
			for(let i = 1; i <= 6; i++){
				(function(i){
					if(backsize != 0 && index - 1 + i < items.length){
						var oneitem = items[index - 1 +i];
						var columns = oneitem.split(",");
						$("#img"+i).attr("src", `${columns[1]}`);
						$("#name"+i).text(columns[0]);
						$("#price"+i).text(columns[2]);
						$("#a"+i).attr("href", "detail?name="+ columns[0]);
					}else{
						$("#img"+i).attr("src", "./img/none.png");
						$("#name"+i).text("");
						$("#price"+i).text("");
					}
				
				
				}(i));
				
				
				
			}
		})
	})
	
	
	//listener color condition
	$("input:radio[name='color']").change(function(){
		brand = $("input:radio[name='brand']:checked").val();
		gender = $("input:radio[name='gender']:checked").val();
		color = $(this).val();
		
		$.get("itemfilter?gender="+gender+"&color="+color+"&brand="+brand, function(back){
			back = back.substring(1);
			if(back.length == 0){
				$("#matchinfo").text("No Match Item!!!");
				
			}
			else{
				$("#matchinfo").empty();
			}
			let backsize = back.length;          //record the length of back ,if 0 means no shoes find
			var items = back.split("-");
			
			let index = (cur_page-1)*6;
			
			for(let i = 1; i <= 6; i++){
				(function(i){
					if(backsize != 0 && index - 1 + i < items.length){
						var oneitem = items[index - 1 + i];
						var columns = oneitem.split(",");
						$("#img"+i).attr("src", `${columns[1]}`);
						$("#name"+i).text(columns[0]);
						$("#price"+i).text(columns[2]);
						$("#a"+i).attr("href", "detail?name="+ columns[0]);
					}else{
						$("#img"+i).attr("src", "./img/none.png");
						$("#name"+i).text("");
						$("#price"+i).text("");
					}
				
				
				}(i));
				
				
				
			}
		})
	})
	

		
		
	



})


