<%-- 
    Document   : csstest
    Created on : 17.Ara.2017, 17:06:56
    Author     : LordAvalon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="crossorigin="anonymous"></script>
    <title>JSP Page</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="wrapper">
            <div class="side-bar">
                <ul>
                    <li class="menu-head">
                        AKINCI <a href="#" class="push_menu"><span class="glyphicon glyphicon-align-justify pull-right"></span></a>
                    </li>
                    <div class="menu">
                        <li>
                            <input type="radio" name="rdButton" value="Sport"><img class="img img-responsive img-circle" src="http://www.pngpix.com/wp-content/uploads/2016/10/PNGPIX-COM-Golden-Football-PNG-Transparent-Image.png" height="60px" width="50px" <span class="glyphicon glyphicon-dashboard pull-right"></span></input>
                        </li>
                        <li>
                            <input type="radio" name="rdButton" value="Economy"><img class="img img-responsive img-circle" src="http://www.freeiconspng.com/uploads/dollar-round-icon--18.png" height="60px" width="50px" <span class="glyphicon glyphicon-heart pull-right"></span></a>
                        </li>
                        <li>
                            <a href="#">Like it? <span class="glyphicon glyphicon-star pull-right"></span></a>
                        </li>
                        <li>
                            <a href="#">Settings <span class="glyphicon glyphicon-cog pull-right"></span></a>
                        </li>
                    </div>

                </ul>
            </div>   
            <div class="content">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">Panel heading without title</div>
                        <div class="panel-body">
                            Panel content
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /#wrapper -->
</body>
</html>
<script
    src="https://code.jquery.com/jquery-3.2.1.min.js"
    integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
crossorigin="anonymous"></script>

<style>
    @import url(http://fonts.googleapis.com/css?family=Lato);

    .container
    {
        width:800px;
        overflow:hidden;
        display:inline-block;
    }
    .side-bar
    {
        background:#23272a;
        position:absolute;
        height:100%;
        width:200px;
        color:#fff;
        transition: margin-left 0.5s;
    }

    .side-bar ul
    {
        list-style:none;
        padding:0px;

    }

    .side-bar ul li.menu-head
    {
        font-family: 'Lato', sans-serif;
        padding:20px;
    }


    .side-bar ul li.menu-head a
    {
        color:#fff;
        text-decoration:none;
        height:50px;
    }


    .side-bar ul .menu-head  a
    {
        color:#fff;
        text-decoration:none;
        height:50px;
    }

    .side-bar ul .menu li  a 
    {
        color:#fff;
        text-decoration:none;
        display:inline-table;
        width:100%;
        padding-left:20px;
        padding-right:20px;
        padding-top:10px;
        padding-bottom:10px;
    }

    .side-bar ul .menu li  a:hover
    {
        border-left:3px solid #ECECEA;    
        padding-left:17px;
    }

    .side-bar ul .menu li  a.active
    {
        padding-left:17px;
        background:#D9853B;
        border-left:3px solid #ECECEA;
    }

    .side-bar ul .menu li  a.active:before {
        content:"";
        position: absolute;
        width: 0;
        height: 0;
        border-top: 20px solid transparent;
        border-bottom: 20px solid transparent;

        border-left: 7px solid #D9853B;
        margin-top: -10px;
        margin-left: 180px;
    }


    .content
    {
        padding-left: 200px;
        transition: padding-left 0.5s;
    }

    .active > .side-bar
    {
        margin-left:-150px;   
        transition: margin-left 0.5s;
    }

    .active > .content
    {
        padding-left:50px;
        transition: padding-left 0.5s;
    }
</style>

<script>
    $(document).ready(function(){
    $(".push_menu").click(function(){
         $(".wrapper").toggleClass("active");
    });
});
</script>
