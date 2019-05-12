

//if ($.validator) {
//    console.log("sdfdfsdfd");
//}
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
	$("#form1").validate({
		rules:{
			
			username:{
				required:true,
				alphaAndspace: true
				
			},
			password:{
				required: true,
				
				PASSWORD: true
			}
		}
	})

})

$("#btn").click(function(){
	event.preventDefault();
	let username = $("#username").val();
	let pwd = $("#pwd").val();
	console.log(username+ "!");
	if (pwd.length==0 ||username.length==0){
		$("span.error").text("Username and password are requied");
	}
	else{
	$.get("user_check?username="+username+"&password="+pwd,  function(back){
		let flag=Number(back);
		if(flag==1){
			window.location.href="home";
		}else{
			$("span.error").text("Username and password inmatch");
		}
	})
	}
})


$("input[type=text").focus(function(){
	$("span.error").empty();
})
