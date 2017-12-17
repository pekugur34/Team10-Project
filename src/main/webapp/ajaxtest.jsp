<%-- 
    Document   : ajaxtest
    Created on : 16.Ara.2017, 20:22:57
    Author     : LordAvalon
--%>

<%@page import="General.NewClass"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Process.Score"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.antlr.v4.runtime.Token"%>
<%@page import="zemberek.morphology.analysis.tr.TurkishSentenceAnalyzer"%>
<%@page import="zemberek.tokenization.TurkishTokenizer"%>
<%@page import="zemberek.morphology.analysis.tr.TurkishMorphology"%>
<%@page import="Questions.EconomyQuestions"%>
<%@page import="Questions.SportQuestions"%>
<%@page import="Answers.GreetingsAnswers"%>
<%@page import="java.util.Arrays"%>
<%@page import="Questions.GreetingsQuestions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    <title>JSP Page</title>
</head>
<body>
    <%!
        String domain = "";
        String answer = "";
        String question = "";
        String[] greetingQuestions = GreetingsQuestions.getGreetings();
        String[] domainQuestions = Domains.Domains.domainQuestions;

        String[] data = new String[15];

        TurkishMorphology morphology = null;
        TurkishTokenizer tokenizer = TurkishTokenizer.DEFAULT;

       
        //

    %>
    
    <%
        String answer=Search.SearchQuery.getP("Michael Jackson ne zaman doğdu?");
        String []split=answer.split("\\.");
        //data=SportQuestions.getJSON();
        
        
        
        ArrayList<String> lstFinal=new ArrayList<String>();
        
        float[] scores=new float[split.length];

        for(int i=0;i<scores.length;i++) {
            if(Score.score("Michael Jackson ne zaman doğdu?", split[i])>2){
                lstFinal.add(split[i]);
            }
        }
        out.print(lstFinal.get(0));

    %>

    <form name="frm" method="get" action="ajaxtest.jsp">
        <input type="text" id="txtMessage" name="txtMessage"  required="true"/>
        <input type="submit" id="btnSend" name="btnSend" value="Send"/>
        <hr/>
        <input class="radio" type="radio" checked="true" id="rdSport" name="selection" value="Spor"/>Spor<br/>
        <br/>
        <input class="radio" type="radio" id="rdEconomy" name="selection" value="Ekonomi"/>Ekonomi<br/>
        <hr/>
        <% if (request.getParameter("btnSend") != null) {
                if (Arrays.asList(greetingQuestions).contains(question)) {%>
        <div><%=GreetingsAnswers.greet()%></div>
        <%}%>
        <%}%>





    </form>
</body>
</html>
