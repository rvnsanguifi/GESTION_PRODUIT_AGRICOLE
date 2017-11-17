<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>contactez nous</title>

<link href="css/styles.css" rel="stylesheet" type="text/css" media="screen" />
<link href="css/calendrier.css" rel="stylesheet" type="text/css" media="screen" />
<script src="code_js/calendar.js" type="text/javascript"></script>
</head>
<body>
<%@ include file="en_tete.jsp"%>
<h1> Pour nous contacter voici nos coordonnées</h1>
			<center>
			<form >
			<table  style="background-color:White;border-width:1px;border-style:None;width:500px;">
			<tr style="color:black;background-color:green;font-weight:bold;">
				<th>   Nom </th>
				<th>  Prenom </th>
				<th> Email</th>
				<th>  Numero de telephone</th>
			</tr>
			<tr>
				<th >Hervé</th> 
				<th>NSANGU </th>
				<th>herve@hotmail.com</th>
				<th>+84-6-67-99-99-55</th>
			</tr>
			</table>
			</form>
			</center>
<%@ include file="menu.jsp"%>
 <%@ include file="pied.jsp"%>
</body>
</html>