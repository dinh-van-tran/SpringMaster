<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
<div class="container">
    <p class="greeting-id">The ID is </p>
    <p class="greeting-content">The content is </p>
    <button id="submit" type="button" class="btn btn-success">Get content</button>
</div>
<script src="webjars/jquery/1.11.1/jquery.js"></script>
<script src="webjars/bootstrap/3.3.6/js/bootstrap.js"></script>
<script>
$(document).ready(function(){
    $("#submit").click(function(){
        $.getJSON("http://localhost:8080/RestService/greeting", 
        {
            name : "Dinh"
        },
        function (data) {
            $(".greeting-id").append(data.id);
            $(".greeting-content").append(data.content);
        });
    }); 
});
</script>
</body>
</html>