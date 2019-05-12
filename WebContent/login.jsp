<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
    <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <title></title>
            <meta name="description" content="">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            
 <script
        src="https://code.jquery.com/jquery-3.4.0.min.js"
        integrity="sha256-BJeo0qm959uMBGb65z40ejJYGSgR7REI4+CW1fNKwOg="
        crossorigin="anonymous"></script>       <!--validate-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script> <!--jquery-->
  
            <link rel="stylesheet" href="./css/login.css">
    </head>


<body>
   
    
    <div class = "login">
        <h2>Log In</h2>
        <form action = "user_check"  method = "GET" id ="form1">
            <input type = "text" name = "username" placeholder="username" id = "username">
            

            <input type = "password" name = "password" placeholder="password" id = "pwd">
            <br><span class="error"></span>
            <input type = "submit" value = "LogIn" name = "Login"  id = "btn">
            
          <!--  <a  id ="a_right"  href = "register">Regist</a> -->


        </form>
        <a  id = "a_left" href = "home" >Home</a>


    </div>

  
  

</body>


 <script type = "text/javascript" src = "./js/login.js"></script> 
 
   



</html>