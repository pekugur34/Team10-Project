<%-- 
    Document   : csstest
    Created on : 17.Ara.2017, 17:06:56
    Author     : LordAvalon
--%>

<%@page import="java.util.Collections"%>
<%@page import="Process.Score"%>
<%@page import="Answers.GreetingsAnswers"%>
<%@page import="Questions.SportQuestions"%>
<%@page import="Questions.LastNewsQuestions"%>
<%@page import="Questions.EconomyQuestions"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link href="https://fonts.googleapis.com/css?family=Slabo+27px" rel="stylesheet" /> 
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="crossorigin="anonymous"></script>
    <title>JSP Page</title>
</head>
<%!
    String domain = "";
    String answer = "";
    String question = "";
    String[] greetingQuestions = Questions.GreetingsQuestions.getGreetings();
    String[] domainQuestions = Domains.Domains.domainQuestions;
    String[] anotherQuestions = Questions.AnotherTypeQuestions.getQuestions();

    // String[] data = new String[15];
    //TurkishMorphology morphology = null;
    //TurkishTokenizer tokenizer = TurkishTokenizer.DEFAULT;
    //
    boolean flagGeneralCulture = false;
    boolean flagSport = false;
    boolean flagEconomy = false;
    boolean flagRecentNews = false;

    String selectedDomain = "Hoşgeldin";
%>

<body style="background: linear-gradient(to right,#26a0da, #A5CC82);">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"><b>2017</b></a>
            </div>
            <form action="csstest.jsp" method="post">
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <input type="submit" class="btn btn-primary" name="btnGeneralCulture" id="btnGeneral" value="Genel Kültür"/>
                    <input type="submit" class="btn btn-success" name="btnSport" id="btnSport" value="Spor"/>
                    <input type="submit" class="btn btn-danger" name="btnRecentNews" id="btnRecentNews" value="Son Dakika"/>
                    <input type="submit" class="btn btn-warning" name="btnEconomy" id="btnEconomy" value="Ekonomi"/>
                </div><!-- /.navbar-collapse -->
            </form>
        </div><!-- /.container-fluid -->
    </nav>
    <%
        if (request.getParameter("btnGeneralCulture") != null) {
            flagGeneralCulture = true;
            flagSport = false;
            flagEconomy = false;
            flagRecentNews = false;
            selectedDomain = "Genel Kültür";
        } else if (request.getParameter("btnSport") != null) {
            flagGeneralCulture = false;
            flagSport = true;
            flagEconomy = false;
            flagRecentNews = false;
            selectedDomain = "Spor";
        } else if (request.getParameter("btnRecentNews") != null) {
            flagGeneralCulture = false;
            flagSport = false;
            flagEconomy = false;
            flagRecentNews = true;
            selectedDomain = "Son Dakika";
        } else if (request.getParameter("btnEconomy") != null) {
            flagGeneralCulture = false;
            flagSport = false;
            flagEconomy = true;
            flagRecentNews = false;
            selectedDomain = "Ekonomi";
        }

    %>



<div class="container" style="margin-top: 8%;">
    <div class="row"><div class="text-right"><a href="https://github.com/pekugur34/Team10-Project" target="_blank"><img style="position: absolute; top: 0; right: 0; border: 0;" src="https://camo.githubusercontent.com/652c5b9acfaddf3a9c326fa6bde407b87f7be0f4/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f6f72616e67655f6666373630302e706e67" alt="Fork me on GitHub" data-canonical-src="https://s3.amazonaws.com/github/ribbons/forkme_right_orange_ff7600.png"></a></div></div>
    <div class="col-md-6 col-md-offset-3">     
        <div class="row">
            <div id="logo" class="text-center">
                <h1><%=selectedDomain%></h1><p><b>IKU</b></p>
            </div>
            <form role="form" id="form-buscar" action="csstest.jsp" method="post">
                <div class="form-group">
                    <div class="input-group">
                        <input id="1" class="form-control" type="text" id="txtSearch" name="txtSearch" placeholder="Birşeyler sorun ve arayın..." required/>
                        <span class="input-group-btn">
                            <button class="btn btn-success" id="btnSearch" name="btnSearch" type="submit">
                                <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i> Sor
                            </button>
                        </span>
                    </div>
                </div>
            </form>

        </div>


        <% if (request.getParameter("btnSearch") != null && flagGeneralCulture) {
            ArrayList<String> lstFinal = new ArrayList<String>();
            try{
                String question = request.getParameter("txtSearch");
                String answer = Search.SearchQuery.getP(question);
                String[] split = answer.split("\\.");

                

                float[] scores = new float[split.length];

                for (int i = 0; i < scores.length; i++) {
                    if (Score.score(question, split[i]) > 1.50) {
                        lstFinal.add(split[i]);
                    }

                }
                Collections.sort(lstFinal);
                Collections.reverse(lstFinal);
            }catch(Exception ex){
                out.print("Bu soruya bir cevap bulamadım :(");
            }
            
                for (int i = 0; i < lstFinal.size(); i++) {%>
                <div class="text-center"><i><b><%=lstFinal.get(i)%></b></i></div>
        <hr/>
        <%}%>

        <%}%>

        <% if (request.getParameter("btnSearch") != null) {
                if (Arrays.asList(greetingQuestions).contains(request.getParameter("txtSearch"))) {%><!--If it is a greeting question -->
        <div class="text-center"><span class="label label-success"><%=GreetingsAnswers.greet()%></span></div>
        <%}%>  
        <%}%>

        <% if (request.getParameter("btnSearch") != null && Arrays.asList(anotherQuestions).contains(request.getParameter("txtSearch").toString())) {%>
        <div class="text-center"><span class="label label-success"><%=Answers.AnotherTypeAnswers.giveAnswer()%></span></div>
        <%}%>

        <% if (request.getParameter("btnSearch") != null && flagSport) {
                if (Arrays.asList(domainQuestions).contains(request.getParameter("txtSearch"))) {
                    ArrayList<String> json = SportQuestions.getJSON();%>
        <div class='row'>
            <div class='col-md-4' >
                <div class="card text-center">
                    <img class="card-img-top" width="40px" height="40px" src="https://young.scot/media/6578/sports-banner.png?width=500&height=312.5" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Spor</h4>
                            <p class="card-text" style='height: 50px;'><%=json.get(0)%></p>
                            <a href='<%=json.get(1)%>' target="_blank" class="btn btn-primary" style='margin-bottom:0px'>Haberin İçeriği</a>
                        </div>
                </div>
            </div>
            <div class='col-md-4'>
                <div class="card text-center"  >
                    <img class="card-img-top" width="40px" height="40px" src="https://young.scot/media/6578/sports-banner.png?width=500&height=312.5" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Spor</h4>
                            <p class="card-text" style='height: 50px;'><%=json.get(3)%></p>
                            <a href='<%=json.get(4)%>' target="_blank" class="btn btn-primary" style='margin-bottom:0px'>Haberin İçeriği</a>
                        </div>
                </div>
            </div>
            <div class='col-md-4'>
                <div class="card text-center" >
                    <img class="card-img-top" width="40px" height="40px" src="https://young.scot/media/6578/sports-banner.png?width=500&height=312.5" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Spor</h4>
                            <p class="card-text" style='height: 50px;'><%=json.get(6)%></p>
                            <a href='<%=json.get(7)%>' target="_blank" class="btn btn-primary" style='margin-bottom:0px'>Haberin İçeriği</a>
                        </div>
                </div>
            </div>

        </div>
        <hr/>
        <div class='row'>
            <div class='col-md-2'>

            </div>
            <div class='col-md-4'>
                <div class="card text-center">
                    <img class="card-img-top" width="40px" height="40px" src="https://young.scot/media/6578/sports-banner.png?width=500&height=312.5" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Spor</h4>
                            <p class="card-text" style=' height: 50px;'><%=json.get(9)%></p>
                            <a href='<%=json.get(10)%>' target="_blank" class="btn btn-primary" style='margin-bottom:0px'>Haberin İçeriği</a>
                        </div>
                </div>
            </div>
            <div class='col-md-4'>
                <div class="card text-center" >
                    <img class="card-img-top" width="40px" height="40px" src="https://young.scot/media/6578/sports-banner.png?width=500&height=312.5" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Spor</h4>
                            <p class="card-text" style='height: 50px;'><%=json.get(12)%></p>
                            <a href='<%=json.get(13)%>' target="_blank" class="btn btn-primary" style='margin-bottom:0px'>Haberin İçeriği</a>
                        </div>
                </div>
            </div>
            <div class='col-md-2'>

            </div>

        </div>


        <%}%>
        <%}%>

        <% if (request.getParameter("btnSearch") != null && flagRecentNews) {
                if (Arrays.asList(domainQuestions).contains(request.getParameter("txtSearch"))) {
                    ArrayList<String> json = LastNewsQuestions.getJSON();%>
        <div class='row'>
            <div class='col-md-4' >
                <div class="card text-center">
                    <img class="card-img-top" width="40px" height="40px" src="http://ikon.news/images/reports/crop_son%20dakika.jpg" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Son Dakika</h4>
                            <p class="card-text" style='height: 50px;'><%=json.get(0)%></p>
                            <a href='<%=json.get(1)%>' target="_blank" class="btn btn-primary" style='margin-bottom:0px'>Haberin İçeriği</a>
                        </div>
                </div>
            </div>
            <div class='col-md-4'>
                <div class="card text-center"  >
                    <img class="card-img-top" width="40px" height="40px" src="http://ikon.news/images/reports/crop_son%20dakika.jpg" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Son Dakika</h4>
                            <p class="card-text" style='height: 50px;'><%=json.get(3)%></p>
                            <a href='<%=json.get(4)%>' target="_blank" class="btn btn-primary" style='margin-bottom:0px'>Haberin İçeriği</a>
                        </div>
                </div>
            </div>
            <div class='col-md-4'>
                <div class="card text-center" >
                    <img class="card-img-top" width="40px" height="40px" src="http://ikon.news/images/reports/crop_son%20dakika.jpg" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Son Dakika</h4>
                            <p class="card-text" style='height: 50px;'><%=json.get(6)%></p>
                            <a href='<%=json.get(7)%>' target="_blank" class="btn btn-primary" style='margin-bottom:0px'>Haberin İçeriği</a>
                        </div>
                </div>
            </div>

        </div>
        <hr/>
        <div class='row'>
            <div class='col-md-2'>

            </div>
            <div class='col-md-4'>
                <div class="card text-center">
                    <img class="card-img-top" width="40px" height="40px" src="http://ikon.news/images/reports/crop_son%20dakika.jpg" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Son Dakika</h4>
                            <p class="card-text" style=' height: 50px;'><%=json.get(9)%></p>
                            <a href='<%=json.get(10)%>' target="_blank" class="btn btn-primary" style='margin-bottom:0px'>Haberin İçeriği</a>
                        </div>
                </div>
            </div>
            <div class='col-md-4'>
                <div class="card text-center" >
                    <img class="card-img-top" width="40px" height="40px" src="http://ikon.news/images/reports/crop_son%20dakika.jpg" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Son Dakika</h4>
                            <p class="card-text" style='height: 50px;'><%=json.get(12)%></p>
                            <a href='<%=json.get(13)%>' target="_blank" class="btn btn-primary" style='margin-bottom:0px'>Haberin İçeriği</a>
                        </div>
                </div>
            </div>
            <div class='col-md-2'>

            </div>

        </div>
        <%}%>
        <%}%>

        <% if (request.getParameter("btnSearch") != null && flagEconomy) {
                if (Arrays.asList(domainQuestions).contains(request.getParameter("txtSearch"))) {
                    ArrayList<String> json = EconomyQuestions.getJSON();%>
        <div class='row'>
            <div class='col-md-4' >
                <div class="card text-center">
                    <img class="card-img-top" width="40px" height="40px" src="https://www.shareicon.net/download/2017/01/23/873475_euro_512x512.png" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Ekonomi</h4>
                            <p class="card-text" style='height: 50px;'><%=json.get(0)%></p>
                            <a href='<%=json.get(1)%>' target="_blank" class="btn btn-primary" style='margin-bottom:0px'>Haberin İçeriği</a>
                        </div>
                </div>
            </div>
            <div class='col-md-4'>
                <div class="card text-center"  >
                    <img class="card-img-top" width="40px" height="40px" src="https://www.shareicon.net/download/2017/01/23/873475_euro_512x512.png" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Ekonomi</h4>
                            <p class="card-text" style='height: 50px;'><%=json.get(3)%></p>
                            <a href='<%=json.get(4)%>' target="_blank" class="btn btn-primary" style='margin-bottom:0px'>Haberin İçeriği</a>
                        </div>
                </div>
            </div>
            <div class='col-md-4'>
                <div class="card text-center" >
                    <img class="card-img-top" width="40px" height="40px" src="https://www.shareicon.net/download/2017/01/23/873475_euro_512x512.png" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Ekonomi</h4>
                            <p class="card-text" style='height: 50px;'><%=json.get(6)%></p>
                            <a href='<%=json.get(7)%>' target="_blank" class="btn btn-primary" style='margin-bottom:0px'>Haberin İçeriği</a>
                        </div>
                </div>
            </div>

        </div>
        <hr/>
        <div class='row'>
            <div class='col-md-2'>

            </div>
            <div class='col-md-4'>
                <div class="card text-center">
                    <img class="card-img-top" width="40px" height="40px" src="https://www.shareicon.net/download/2017/01/23/873475_euro_512x512.png" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Ekonomi</h4>
                            <p class="card-text" style=' height: 50px;'><%=json.get(9)%></p>
                            <a href='<%=json.get(10)%>' target="_blank" class="btn btn-primary" style='margin-bottom:0px'>Haberin İçeriği</a>
                        </div>
                </div>
            </div>
            <div class='col-md-4'>
                <div class="card text-center" >
                    <img class="card-img-top" width="40px" height="40px" src="https://www.shareicon.net/download/2017/01/23/873475_euro_512x512.png" alt="Card image">
                        <div class="card-body">
                            <h4 class="card-title">Ekonomi</h4>
                            <p class="card-text" style='height: 50px;'><%=json.get(12)%></p>
                            <a href='<%=json.get(13)%>' target="_blank" class="btn btn-primary" style='margin-bottom:0px'>Haberin İçeriği</a>
                        </div>
                </div>
            </div>
            <div class='col-md-2'>

            </div>

        </div>
        <%}%>
        <%}%>


        <div class="row">
            <div class="text-center">

            </div>
        </div>
    </div>
</div>
</body>
</html>

<style>
    * {
        -webkit-border-radius: 1px !important;
        -moz-border-radius: 1px !important;
        border-radius: 1px !important;
    }
    #logo {
        color: #666;
        width:100%;   
    }
    #logo h1 {
        font-size: 60px;
        text-shadow: 1px 2px 3px #999;
        font-family: Roboto, sans-serif;
        font-weight: 700;
        letter-spacing: -1px;
    }
    #logo p{
        padding-bottom: 20px;
    }


    #form-buscar >.form-group >.input-group > .form-control {
        height: 40px;
    }
    #form-buscar >.form-group >.input-group > .input-group-btn > .btn{
        height: 40px; 
        font-size: 16px;
        font-weight: 300; 


    }
    #form-buscar >.form-group >.input-group > .input-group-btn > .btn .glyphicon{
        margin-right:12px;   
    }    


    #form-buscar >.form-group >.input-group > .form-control {
        font-size: 16px;
        font-weight: 300;

    }

    #form-buscar >.form-group >.input-group > .form-control:focus {
        border-color: #33A444;
        outline: 0;
        -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 1px rgba(0, 109, 0, 0.8);
        box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 1px rgba(0, 109, 0, 0.8);
    }

</style>
</html>

