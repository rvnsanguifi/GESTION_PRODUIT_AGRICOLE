

<div id="content">
<!-- header begins -->
<div id="header">
	<div id="logo">
		<h1><a>Gestion d'une Ferme</a></h1>
		<h2><a>Agricole</a></h2>
	</div>

<ul id="nav">

	<li id="first">
		<div class="divlink"><a>Home</a></div>
		<ul>
			<li><a href="<%=request.getContextPath()+"/Agent/index.jsp"%>">mon compte</a></li>
			<li><a href="<%=request.getContextPath()+"/Agent/modifier_password.jsp"%>">modifier mon mot de passe</a></li>
		</ul>
	</li> 

	<li>
		<div class="divlink"><a href="<%=request.getContextPath()+"/Agent/ajouter.jsp"%>">ajouter</a></div>
	</li>

<li>
		<div class="divlink"><a>consulter</a></div>
		<ul>
			<li><a href="<%=request.getContextPath()+"/InStock"%>">stock entré</a></li>
			<li><a href="<%=request.getContextPath()+"/OutStock"%>">stock sorti</a></li>
			<li><a href="<%=request.getContextPath()+"/Produit"%>">produit</a></li>
			<li><a href="<%=request.getContextPath()+"/Ennemie"%>">ennemie</a></li>
			<li><a href="<%=request.getContextPath()+"/Machine"%>">machine</a></li>
		</ul>
	</li>

<li>
		<div class="divlink"><a href="<%=request.getContextPath()+"/index.jsp?b=decon"%>">se deconnecter</a></div>
		
	</li>

	
</ul>


</div>
<div id=right>
