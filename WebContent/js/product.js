/**
 * 
 */
//by the color ajax find size, then find quantity by color and size(ajax too)
$(function(){
	 var size = "" ;
	 var quantity = "";
	 var color = "";
	var name = $("#name").val();
	 var numbers = "";
	 
	 $("#color").change(function(){
		 color = $(this).val();
		 $.get("findcolor?color="+color, function(back){
			 back.substring(0, back.length - 1);
			 var ary = back.split(" ");
			 $('#size').empty();    //need clear the element, otherwise last time add elements still there
			 $('#size').append(`<option ></option>`);
			 $.each(ary, function(i, val){
				 console.log(val);
				 
				 $('#size').append(`<option value = ${val}>${val}</option>`);
			 })
				 
			  
		 })
	 });
	  
	
	 
	 
	 $("#size").change(function(){
	     size = ($(this).val());
	     
	     $.get("findcapacity?size="+size+"&color="+color, function(back){    //ajax 有乱码
	 		 numbers = (encodeURIComponent(back));
	 		 var txt=numbers.substr(1);
	 		 var value = 0;
	 		 var index = 0;
	 		 for(let i = txt.length - 1 ; i >= 0; i --){
	 			 if(txt[i]=='A')
	 				 value += 11 *  Math.pow(16 ,index);
	 			 else if(txt[i] == 'B')
	 				 value += 12 * Math.pow(16 ,index);
	 			 else if(txt[i] == 'C'){
	 				 
	 				 value += 13 * Math.pow(16 ,index);
	 			 }
	 			 else if(txt[i] == 'D')
	 				 value += 14 * Math.pow(16 ,index);
	 			 else if(txt[i] == 'E')
	 				 value += 15 * Math.pow(16 ,index);
	 			 else if(txt[i] == 'F')
	 				 value += 15 * Math.pow(16 ,index);
	 			 else {
	 				 value += Number(txt[i]) *Math.pow(16 ,index);
	 			 }
	 			 index ++;
	 		 }
	 		 $('#quantity').empty();
	 		$('#quantity').append(`<option value = 0>0</option>`);
	 		 for(let i = 0; i <= value; i++){
	 			 $('#quantity').append(`<option value = ${i}>${i}</option>`);
	 		 } });
	 	})
	 	

	 	
	 	
	 	
	 	$("#quantity").change(function(){
			quantity = $(this).val();
		});
	   
		//jump and decide next page by go flag
		$("#submitcart").click(function(){
			
			if(size.length==0 || color.length== 0 || quantity.length  == 0)
			{
				$("#spanerror").text("Make choice first please!!!");
				return false;
			}
			if(Number(quantity) == 0){
				$("#spanerror").text("Out of stock!!!");
				return false;
			}
		
			window.location.href = "addtocart?color="+color+"&size="+size+"&quantity="+quantity+"&go=no";
			
		});
		
		$("#submitcartandgo").click(function(){
			
			if(size.length==0 || color.length == 0 || quantity.length == 0)
			{
				$("#spanerror").text("Make choice first please!!!");
				return false;
			}
			if(Number(quantity) == 0){
				$("#spanerror").text("Out of stock!!!");
				return false;
			}
			
			window.location.href = "addtocart?color="+color+"&size="+size+"&quantity="+quantity+"&go=go";
			
		});
		
		
	});


	
	
	 
	
	
	
	
	



	