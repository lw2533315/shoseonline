<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Registe</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
       <script
        src="https://code.jquery.com/jquery-3.4.0.min.js"
        integrity="sha256-BJeo0qm959uMBGb65z40ejJYGSgR7REI4+CW1fNKwOg="
        crossorigin="anonymous"></script>       <!--validate-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script> <!--jquery-->
        <link rel="stylesheet" href="./css/register.css">
    </head>
    <body>
        <div class = "fillcolor">
        <div class="login">
                <a href = "home">home</a>
            
            <h1>Register</h1>
            <!-- if insert success , jump to home.jsp -->
            <form action = "save_customer" method = "get"  id="form2">
                <label >FirstName</label><span class="red-star">*</span><br>
                <input type = "text" class="bigdiv"name= "firstname" placeholder="firstname"><br>
                 <label >LastName</label><span class="red-star">*</span><br>
                <input type = "text" class = "bigdiv" name= "lastname" placeholder="lastname"><br>
                <label for="username">Username</label><span class="red-star">*</span><br>
                <input type = "text" class = "bigdiv" name = "username" id = "username" placeholder="username"><span class="error" id="usernameerror"></span><br>
                <label for = "email">Email</label><span class="red-star">*</span><br>
                <input type = "email" class = "bigdiv" name = "email" id = "email" placeholder="email"><span class="error" id="emailerror"></span><br>
                <label for = "password">Password</label><span class="red-star">*</span><br>
                <input type = "password" class = "bigdiv"name = "password" id = "password" placeholder="password"><br>
                <input type = "submit" value ="Register">


            </form>
            
        
        
        <script type = "text/javascript" src = "./js/register.js"></script> 
    </body>
</html>