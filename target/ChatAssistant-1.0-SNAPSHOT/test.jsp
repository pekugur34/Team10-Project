<%-- 
    Document   : test
    Created on : 16.Ara.2017, 13:40:09
    Author     : LordAvalon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
            <script
        src="https://code.jquery.com/jquery-3.2.1.min.js"
        integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
            crossorigin="anonymous"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>

    <form>
        Enter Your Name: <input type="text" id="userName" />
        <select name="mySelect" class="form-control">
            <option value="a">A</option>
            <option value="b">B</option>
            <option value="c">C</option>
        </select>
        <button type="submit" id="btn" name="btn" >Buton</button>
    </form>
    <br>
    <br>
    <%if(request.getParameter("btn")!=null && request.getParameter("mySelect").equals("a"))
    out.print("Hey");
    %>
    
    <strong>Ajax Response</strong>:
<div id="ajaxGetUserServletResponse"></div>
</body>
</html>
</html>
    <script>
        $(document).ready(function() {
        $('#userName').blur(function(event) {
                var name = $('#userName').val();
                $.get('GetUserServlet', {
                        userName : name
                }, function(responseText) {
                        $('#ajaxGetUserServletResponse').text(responseText);
                });
        });
});
    </script>
