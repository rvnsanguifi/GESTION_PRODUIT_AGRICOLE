<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="../css/menu1.css" rel="stylesheet" type="text/css" media="screen" />
<link href="../css/styles.css" rel="stylesheet" type="text/css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script language="javaSCript">
function verifier_old_password(champ)
{
	var oldpassword=champ.value
	if(oldpassword!=<%= session.getAttribute("attribut1")%>)
	{
		document.getElementById("oldpasswd").style.visibility="visible";
		document.getElementById("oldpasswd").style.position="relative";
		return false;
	}
	else
	{
		document.getElementById("oldpasswd").style.visibility="hidden";
		document.getElementById("oldpasswd").style.position="absolute";
		return true;
	}
}
function verifier_mdp1(champ)
{
	var mdp1=champ.value;
	if(mdp1=="")
	{
		document.getElementById("md1").style.visibility="visible";
		document.getElementById("md1").style.position="relative";
		document.getElementById("md").style.visibility="hidden";
		return false;
	}
	else if(mdp1.length<6)
	{
		document.getElementById("md1").style.visibility="hidden";
		document.getElementById("md").style.visibility="visible";
		document.getElementById("md1").style.position="absolute";
	}
	else
	{
		document.getElementById("md1").style.position="absolute";
		document.getElementById("md1" ).style.visibility="hidden";
		document.getElementById("md").style.visibility="hidden";
		return true;
	}
}
function verifier_mdp2(champ)
{
	var mdp1=f.mdp1.value;
	var mdp2=champ.value;
	if(mdp2=="")
	{
		document.getElementById("mp2").style.visibility="visible";
		document.getElementById("mp").style.visibility="hidden";
		document.getElementById("mp2").style.position="relative";
		return false;
	}
	else if(mdp1!=mdp2)
	{
		document.getElementById("mp").style.visibility="visible";
		document.getElementById("mp2").style.visibility="hidden";
		
	}
	else
	{
		document.getElementById("mp").style.visibility="hidden";
		document.getElementById("mp2").style.visibility="hidden";
		return true; 
	}
}

function verifier()
{
	var oldmp=verifier_old_password(f.old_passwd);
	var mp1=verifier_mdp1(f.mdp1);
	var mp2=verifier_mdp2(f.mdp2);
	if(oldmp && mp1 && mp2)
	{ 
		return true;
	}
	else
	{
	return false;
	}
}
</script>
</head>
<body>
<form name=f action="../modifier_password" onsubmit="return verifier();">
<%@ include file="en_tete.jsp"%>
<H1>Veuillez saisir vos coordonnées s'il vous plait</H1>
  <div >
    <table align="center" style="width: 500px; height: 106px">
            <tr align="justify">
                <td bgcolor="Gray"  colspan="4">
                    &nbsp;</td>
            </tr>

            <tr align="justify">
                <td bgcolor="Silver"  rowspan="3" align="center" >
                    Modification:</td>
                <td bgcolor="Silver" >
                    Ancien mot de passe
                </td>
                    <td bgcolor="Gray"> 
                    <input name="old_passwd" type="password" maxlength="20" onblur="verifier_old_password(this)" style="color:Black;background-color:White;border-color:White;border-style:Inset;height:20px;width:150px;" />
					<span id="oldpasswd" style="color:White;visibility:hidden;position:absolute;">Ancien mot de passe incorrect</span>
					
                    <br />
                </td>
                
                </td>
            </tr>
            <tr align="justify">
                <td bgcolor="Silver">
                   Nouveau mot de passe:
                   </td>
                <td bgcolor="Gray">
                    <input name="mdp1" type="password"  onblur="verifier_mdp1(this)" maxlength="20"  style="color:Black;background-color:White;border-color:White;border-style:Inset;height:20px;width:150px;" />
                <span id="md" style="color:White;visibility:hidden;">Min 6 caracteres</span>
                <span id="md1" style="color:White;visibility:hidden;">Saisir un mot de passe</span>
                </td>
                </tr>
                <tr>
                <td bgcolor="Silver">
                   Confirmer mot de passe:
				</td>
                <td bgcolor="Gray">
                <input name="mdp2" type="password"  onblur="verifier_mdp2(this)" maxlength="20"  style="color:Black;background-color:White;border-color:White;border-style:Inset;height:20px;width:150px;" />
                <span id="mp" style="color:White;visibility:hidden;">Mot de passe invalide</span> 
              	<span id="mp2" style="color:White;visibility:hidden;">Confirmer votre mot de passe</span> 
                </td>
                </tr>
                <tr>
                <td>
                <input type="submit"  value="Enregistrer"  style="color:Black;border-color:#669900;border-style:Groove;height:22px;width:147px;" />
            	</td>
             	</tr>
            <tr align="justify">
                <td bgcolor="Gray"  colspan="4">
                    &nbsp;</td>
            </tr>
            </table>
        </div>
</form>
<%@ include file="menu.jsp"%>
<%@ include file="../pied.jsp"%>
</body>
</html>