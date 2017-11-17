<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="ma.connexion.Connect" import="java.util.Vector"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
Connect connexion=new Connect();
Vector resultat;
Vector resultat_final;
%>
<html>
<head>
<link href="css/styles.css" rel="stylesheet" type="text/css" media="screen" />
<link href="css/menu1.css" rel="stylesheet" type="text/css" media="screen" />
<link href="css/calendrier.css" rel="stylesheet" type="text/css" media="screen" />
<script src="code_js/calendar.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>notre Galerie</title>
</head>
<body>
<%@ include file="en_tete.jsp"%>
<form>
<%

	resultat=connexion.getData("select imgnom from galerie");
	 
  	for(int i=0;i<resultat.size();++i)
	{
			resultat_final=(Vector)resultat.elementAt(i);
			
	%>
	<img src="<%=resultat_final.elementAt(0) %>">
	<%
	
	}
	%> 
</form>
</body>
<%@ include file="menu.jsp"%> 
<%@ include file="pied.jsp"%>
</html>