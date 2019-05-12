/**


 * 
 */


$.validator.addMethod( "alphaAndspace", function( value, element ) {
	return this.optional( element ) || /^[a-zA-Z\s]*$/.test( value );
}, "character and whitespace only" );


$.validator.addMethod( "email", function( value, element ) {
	return this.optional( element ) || /^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i.test( value );
}, "email invalid" );


$.validator.addMethod("PASSWORD", function (value, element) {
    return this.optional(element) || /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,16}$/i.test(value);
}, "6-16 uppercase letters, lowercase letters and at least one number."); 
$(function(){
	$("#form2").validate({
		rules:{
			firstname:{
				required:true,
				alphaAndspace: true
			},
			lastname:{
				required:true,
				alphaAndspace: true
			},
			
			
			username:{
				required:true,
				
			},
			email:{
				required:true,
				email:true
			},
			password:{
				required: true,
				
				PASSWORD: true
			}
		}
	})

})


var username =null;

var email=null;

$("#username").blur(function(){
	
	username = $(this).val();
	$.get("checkname?username="+username, function(info){
		
		let flag=Number(info)
		if(flag===1){
			$("#usernameerror").text("The username has existed");
		}else{
			$("#usernameerror").empty();
		}
	})
	
	
})

$("#email").blur(function(){
	
//	email = $(this).val();
//	console.log(email);
//	$.post("mailvalidate", {email:email}, function(back){
//		console.log(back);
//	})
    email=$(this).val();
    $.get("mailvalidate?email="+email, function(back){
    	let flag = Number(back);
    	if(flag===1){
			$("#emailerror").text("The email address has existed");
		}else{
			$("#emailerror").empty();
		}
    })
	
	
})




