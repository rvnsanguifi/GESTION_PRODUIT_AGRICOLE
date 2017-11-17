<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="ma.connexion.*"  import="java.sql.*" import="java.io.*" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Ajouter une tâche</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ajouter un utilisateur</title>
<link href="../css/menu1.css" rel="stylesheet" type="text/css" media="screen" />
<link href="../css/styles.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body >
	<%@ include file="en_tete.jsp"%>
<%
Connect connexion=new Connect();
String requet=""; 
String produit=request.getParameter("slt");
int valeur=Integer.parseInt(produit);
//variable commun
String code=request.getParameter("code"+valeur);
String designation=request.getParameter("designation"+valeur);
String date=request.getParameter("date"+valeur);
String magasin=request.getParameter("magasin"+valeur);
String agent=request.getParameter("agent"+valeur);
String quantite=request.getParameter("quantite"+valeur);
String obs=request.getParameter("obs"+valeur);
String nom_produit=request.getParameter("nom_produit"+valeur);
String nom_machine=request.getParameter("nom_machine"+valeur);
String code_stock=request.getParameter("LSTCODEST"+valeur);
String btn1=request.getParameter("btn1");
//variable stock entré
String etat=request.getParameter("lstetat");
//variable stock sortie
String tache=request.getParameter("tache");
//variable du produit
String fournisseur=request.getParameter("fornlist");
String matiere=request.getParameter("matiere");
String molecule=request.getParameter("molecule");
String img_produit=request.getParameter("img_produit");
//variable ennemie
String nom_ennemie=request.getParameter("nom_ennemie");
String pic_ennemie=request.getParameter("pic_ennemie");
/*File image_ennemie=new File(pic_ennemie);
FileInputStream fin = new FileInputStream (image_ennemie) ;*/
//variable de machine
/********************************************************************/
String requet1="insert into instocke values('"+code+"','"+quantite+"','"+magasin+"','"+agent+"','"+obs+"','"+designation+"','"+etat+"','"+date+"')";
String requet2="insert into outstocke values('"+code+"','"+quantite+"','"+magasin+"','"+agent+"','"+obs+"','"+designation+"','"+tache+"','"+date+"','"+nom_produit+"','"+nom_machine+"')";
String requet4="insert into ennemie  values('"+code+"','"+nom_ennemie+"','"+pic_ennemie+"')";
String requet3="insert into produit values('"+code+"','"+code_stock+"','"+nom_produit+"','"+matiere+"','"+molecule+"','"+fournisseur+"')";
String requet5="insert into machine values('"+code+"','"+code_stock+"','"+nom_machine+"','"+obs+"')";
String requet_3="insert into aune values('"+img_produit+"','"+code+"')";
String requet_1="insert into stocke values('"+code+"','"+quantite+"','"+magasin+"','"+agent+"','"+obs+"','"+designation+"')";
String requet_2="delete from stocke  where CODESTOCKE= (select CODESTOCKE from produit where NOMCOMMERCIAL='"+request.getParameter("nom_produit2")+"')";
/********************************************************************/

switch(valeur)
{
case 1:
	requet=requet1;
	break;
case 2:
	requet=requet2;
	break;
case 3:
	requet=requet3;
	break;
case 4:
	requet=requet4;
	break;
case 5:
	requet=requet5;
	break;
default:out.println("erreur");
}
try {
	if(valeur==1)
	{
		connexion.setData(requet_1);
		connexion.setData(requet);
		out.println("les données ont bien été enregistrées");
	}
	else if(valeur==2)
	{
		connexion.setData(requet_2);
		connexion.setData(requet);
		out.println("les données ont bien été enregistrées");
	}
	else if(valeur==3)
	{
		connexion.setData(requet_3);
		connexion.setData(requet);
		out.println("les données ont bien été enregistrées");
	}
	else
	{
	    connexion.setData(requet);
		out.println("les données ont bien été enregistrée");
	}	
	}catch(Exception e){
		out.println(e);
		}


%>
	<%@ include file="menu.jsp"%>
 <%@ include file="../pied.jsp"%>
 </body>
</html>