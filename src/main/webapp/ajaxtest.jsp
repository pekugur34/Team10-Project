<%-- 
    Document   : ajaxtest
    Created on : 16.Ara.2017, 20:22:57
    Author     : LordAvalon--Uğur Pek
--%>


<%@page import="Questions.LastNewsQuestions"%>
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
        String[] greetingQuestions = Questions.GreetingsQuestions.getGreetings();
        String[] domainQuestions = Domains.Domains.domainQuestions;
        String[] anotherQuestions = Questions.AnotherTypeQuestions.getQuestions();

        // String[] data = new String[15];
        //TurkishMorphology morphology = null;
        //TurkishTokenizer tokenizer = TurkishTokenizer.DEFAULT;

        //

    %>

    <%

       /* String answer = Search.SearchQuery.getP("Michael Jackson ne zaman doğdu?");
        String[] split = answer.split("\\.");

        ArrayList<String> lstFinal = new ArrayList<String>();

        float[] scores = new float[split.length];

        for (int i = 0; i < scores.length; i++) {
            if (Score.score("Michael Jackson ne zaman doğdu?", split[i]) > 2) {
                lstFinal.add(split[i]);
            }
        }
        out.print(lstFinal.get(0));
*/
    %>

    <form name="frm" method="post" action="ajaxtest.jsp">
        <input type="text" id="txtMessage" name="txtMessage"  required="true"/>
        <input type="submit" id="btnSend" name="btnSend" value="Send"/>
        <hr/>
        <input class="radio" type="radio" id="rdGeneralCulture" name="selection" value="GenelKultur" />Genel Kültür<br/>
        <br/>
        <input class="radio" type="radio"  id="rdSport" name="selection" value="Spor"/>Spor<br/>
        <br/>
        <input class="radio" checked="true" type="radio" id="rdEconomy" name="selection" value="SonDakika"/>Son Dakika<br/>
        <br/>
        <input class="radio" type="radio" id="btnEconomy" name="selection" value="Ekonomi"/>Ekonomi<br/>
        
        <% if(request.getParameter("btnSend")!=null && request.getParameter("selection").equals("GenelKultur")){
        String question=request.getParameter("txtMessage");
        String answer = Search.SearchQuery.getP(question);
        String[] split = answer.split("\\.");

        ArrayList<String> lstFinal = new ArrayList<String>();

        float[] scores = new float[split.length];

        for (int i = 0; i < scores.length; i++) {
            if (Score.score(question, split[i]) > 2) {
                lstFinal.add(split[i]);
            }
        }
        out.print(lstFinal.get(0));
        %>
            
        <%}%>
        
        <% if (request.getParameter("btnSend") != null) {
                if (Arrays.asList(greetingQuestions).contains(request.getParameter("txtMessage"))) {%><!--If it is a greeting question -->
        <div><%=GreetingsAnswers.greet()%></div>
        <%}%>  
        <%}%>

        <% if (request.getParameter("btnSend") != null && Arrays.asList(anotherQuestions).contains(request.getParameter("txtMessage").toString())) {%>
        <div><%=Answers.AnotherTypeAnswers.giveAnswer()%></div>
        <%}%>

        <% if (request.getParameter("btnSend") != null && request.getParameter("selection").equals("Spor")) {
                if (Arrays.asList(domainQuestions).contains(request.getParameter("txtMessage"))) {
                    out.print("Hey");
                    ArrayList<String> json = SportQuestions.getJSON();%>
        <div class="text-right"><%=json.get(0)%></div>
        <div class="text-right"><a href='<%=json.get(1)%>'>Haberin içeriği...</a></div>
        <div class="text-right"><img src='https://png.pngtree.com/element_origin_min_pic/16/10/25/58e1a9d5bd491f5f31290677da4c77a0.jpg' width='70px' height='70px'/></div>

        <div class="text-right"><%=json.get(3)%></div>
        <div class="text-right"><a href='<%=json.get(4)%>'>Haberin içeriği...</a></div>
        <div class="text-right"><img src='https://png.pngtree.com/element_origin_min_pic/16/10/25/58e1a9d5bd491f5f31290677da4c77a0.jpg' width='70px' height='70px'/></div>

        <div class="text-right"><%=json.get(6)%></div>
        <div class="text-right"><a href='<%=json.get(7)%>'>Haberin içeriği...</a></div>
        <div class="text-right"><img src='https://png.pngtree.com/element_origin_min_pic/16/10/25/58e1a9d5bd491f5f31290677da4c77a0.jpg' width='70px' height='70px'/></div>

        <div class="text-right"><%=json.get(9)%></div>
        <div class="text-right"><a href='<%=json.get(10)%>'>Haberin içeriği...</a></div>
        <div class="text-right"><img src='https://png.pngtree.com/element_origin_min_pic/16/10/25/58e1a9d5bd491f5f31290677da4c77a0.jpg' width='70px' height='70px'/></div>

        <div class="text-right"><%=json.get(12)%></div>
        <div class="text-right"><a href='<%=json.get(13)%>'>Haberin içeriği...</a></div>
        <div class="text-right"><img src='https://png.pngtree.com/element_origin_min_pic/16/10/25/58e1a9d5bd491f5f31290677da4c77a0.jpg' width='70px' height='70px'/></div>
        <%}%>
        <%}%>

        <% if (request.getParameter("btnSend") != null && request.getParameter("selection").equals("SonDakika")) {
                if (Arrays.asList(domainQuestions).contains(request.getParameter("txtMessage"))) {
                    ArrayList<String> json = LastNewsQuestions.getJSON();%>
        <div class="text-right"><%=json.get(0)%></div>
        <div class="text-right"><a href='<%=json.get(1)%>'>Haberin içeriği...</a></div>
        <div class="text-right"><img src='https://lh3.googleusercontent.com/3tcppFzHE2HGszQqmSviwJZQdGwSXH4bAhM_TdOBHFh55Me7y_lflOT-kIDhgrhxM6E=w300' width='70px' height='70px'/></div>

        <div class="text-right"><%=json.get(3)%></div>
        <div class="text-right"><a href='<%=json.get(4)%>'>Haberin içeriği...</a></div>
        <div class="text-right"><img src='https://lh3.googleusercontent.com/3tcppFzHE2HGszQqmSviwJZQdGwSXH4bAhM_TdOBHFh55Me7y_lflOT-kIDhgrhxM6E=w300' width='70px' height='70px'/></div>

        <div class="text-right"><%=json.get(6)%></div>
        <div class="text-right"><a href='<%=json.get(7)%>'>Haberin içeriği...</a></div>
        <div class="text-right"><img src='https://lh3.googleusercontent.com/3tcppFzHE2HGszQqmSviwJZQdGwSXH4bAhM_TdOBHFh55Me7y_lflOT-kIDhgrhxM6E=w300' width='70px' height='70px'/></div>

        <div class="text-right"><%=json.get(9)%></div>
        <div class="text-right"><a href='<%=json.get(10)%>'>Haberin içeriği...</a></div>
        <div class="text-right"><img src='https://lh3.googleusercontent.com/3tcppFzHE2HGszQqmSviwJZQdGwSXH4bAhM_TdOBHFh55Me7y_lflOT-kIDhgrhxM6E=w300' width='70px' height='70px'/></div>

        <div class="text-right"><%=json.get(12)%></div>
        <div class="text-right"><a href='<%=json.get(13)%>'>Haberin içeriği...</a></div>
        <div class="text-right"><img src='https://lh3.googleusercontent.com/3tcppFzHE2HGszQqmSviwJZQdGwSXH4bAhM_TdOBHFh55Me7y_lflOT-kIDhgrhxM6E=w300' width='70px' height='70px'/></div>
        <%}%>
        <%}%>

        <% if (request.getParameter("btnSend") != null && request.getParameter("selection").equals("Ekonomi")) {
                if (Arrays.asList(domainQuestions).contains(request.getParameter("txtMessage"))) {
                    ArrayList<String> json = EconomyQuestions.getJSON();%>
        <div class="text-right"><%=json.get(0)%></div>
        <div class="text-right"><a href='<%=json.get(1)%>'>Haberin içeriği...</a></div>
        <div class="text-right"><img src='http://icons.iconarchive.com/icons/custom-icon-design/flatastic-4/512/US-dollar-icon.png' width='70px' height='70px'/></div>

        <div class="text-right"><%=json.get(3)%></div>
        <div class="text-right"><a href='<%=json.get(4)%>'>Haberin içeriği...</a></div>
        <div class="text-right"><img src='http://icons.iconarchive.com/icons/custom-icon-design/flatastic-4/512/US-dollar-icon.png' width='70px' height='70px'/></div>

        <div class="text-right"><%=json.get(6)%></div>
        <div class="text-right"><a href='<%=json.get(7)%>'>Haberin içeriği...</a></div>
        <div class="text-right"><img src='http://icons.iconarchive.com/icons/custom-icon-design/flatastic-4/512/US-dollar-icon.png' width='70px' height='70px'/></div>

        <div class="text-right"><%=json.get(9)%></div>
        <div class="text-right"><a href='<%=json.get(10)%>'>Haberin içeriği...</a></div>
        <div class="text-right"><img src='http://icons.iconarchive.com/icons/custom-icon-design/flatastic-4/512/US-dollar-icon.png' width='70px' height='70px'/></div>

        <div class="text-right"><%=json.get(12)%></div>
        <div class="text-right"><a href='<%=json.get(13)%>'>Haberin içeriği...</a></div>
        <div class="text-right"><img src='http://icons.iconarchive.com/icons/custom-icon-design/flatastic-4/512/US-dollar-icon.png' width='70px' height='70px'/></div>
        <%}%>
        <%}%>


    </form>
        
</body>
</html>
