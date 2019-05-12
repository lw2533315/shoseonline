/**
 * 
 */





//update forloop's id
$(function(){
	var price;
	var number;
	var subtotal = 0;
	var size = $("#inputSize").val();
	var mailfee = 0;
	
	mailfee = $("#mailid option:selected").val();
	console.log("current option value: "+ mailfee );
	
	
	//update all loop listener id and calculate the total for each item
	for(let i = 0; i < size; i ++){
		var totalid = "hid" + i;
		var preid = "sst"  + i;
		var up = "buttonup" + i;
		var down = "buttondown" +i;
		var nameid = "nameid" +i;
		var priceid = "priceid" +i;
		var item_id_id = "inputid" +i;
		

		$('#sst').prop('id', preid);
		$('#buttonup').prop('id', up);
		$('#buttondown').prop('id', down);
		$('#hid').prop('id', totalid);
		$('#nameid').prop('id', nameid);
		$('#priceid').prop('id', priceid);
		$('#inputid').prop('id', item_id_id);
		subtotal += Number($(`#${totalid}`).text().substring(1));     //grad the subtotal from totals, notice the $ sign
		$('#subtotal').text("$"+subtotal);
		$('#spantotal').text("$"+(subtotal + mailfee));
		
	}
	
	//grasp the mail fee
	$("#mailid").change(function(){
		 mailfee = $(this).val();
		 $('#spantotal').text("$" + (Number(subtotal) + Number(mailfee)).toFixed(2));
		 
	 console.log("after change mailfee : " + mailfee);
	 
	});
	
	
	//delete item from cart
	$(".deleteclass").change(function(){
		let item_id = $(this).attr("name");
		let customer_id = $(this).attr("id");
		console.log("customer_id: "+ customer_id);
		$.get("cartamend?id="+item_id+"&customer_id="+customer_id +"&quantity="+"0", function(back){
			
		})
		let price = $(this).parents("tr").children().eq(3).children().text().substring(1);
		console.log("price is "+price);
		subtotal = $("#subtotal").text().substring(1);
		console.log("subtotal: "+ subtotal);
		let spantotal = $("#spantotal").text().substring(1);
		subtotal=Number((subtotal)- Number(price)).toFixed(2);   //total - delete price
		$("#subtotal").text("$"+subtotal);
		$("#spantotal").text("$"+(Number(spantotal) - price).toFixed(2));
		
		$("#"+item_id).remove();
	})
	
	
	
	//listener the number change of item
	$(".input-text").bind('input oninput',  function(){
		
		let item_id=$(this).parents("tr").attr("id");
		let customer_id =$(this).parents("tr").attr("name");
		console.log(item_id);
		let price = $(this).parents("tr").children().eq(1).children().text().substring(1);  //find the current item's price
		console.log(price);
		let number = $(this).val();
		$.get("cartamend?id="+item_id+"&customer_id="+customer_id +"&quantity="+number, function(back){
				console.log(back);
				let backary=back.split("-");
				if(back[1] == 0){
					$(this).val(Number(number)-1);
					$("#alerterror").text(item_id + " has not enough stock");
					
				}
		})
		console.log(number);
		let preTotal = 	$(this).parents("tr").children().eq(3).children().text().substring(1);
		let newTotal = Number(price)*Number(number).toFixed(2);
		$(this).parents("tr").children().eq(3).children().text("$"+newTotal.toFixed(2));
		subtotal = $("#subtotal").text().substring(1);;
		let spantotal = $("#spantotal").text().substring(1);
		let changeTotal = Number(newTotal)-Number(preTotal)
		subtotal = (Number(subtotal) + changeTotal).toFixed(2);
		$("#subtotal").text("$"+subtotal);
		$("#spantotal").text("$"+(Number(spantotal) + changeTotal).toFixed(2));
	
	})
	
	
	
	$("#proceed").click(function(){
		if(subtotal == 0){ 
			$("#alerterror").text("Cart is empty!!!");	
			return false;
		}
		else{
		let url = "checkout?subtotal="+subtotal+"&mailfee="+mailfee;
		$(this).attr("href", url);
		}
	})

	
	
	












})