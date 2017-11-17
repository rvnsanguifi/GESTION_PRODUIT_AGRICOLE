package com.Agent.Produit;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ma.connexion.Connect;
/**
 * Servlet implementation class Produit
 */
public class Produit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Vector resultat;
	public Vector resultat_final;
	public Connect connexion=new Connect();
	/**
     * Default constructor. 
     */
    public Produit() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		out.println("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">");
		out.println("<title>Consultation des Produits</title>");
		out.println("<link href=\"css/styles.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("<link href=\"css/table.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("<link href=\"css/menu1.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("</head>");
		out.println("<body>");
		request.getRequestDispatcher("Agent/en_tete.jsp").include(request,response);
		out.println("<h1>Voici la liste des Produits </h1>");
		out.println("<form name=\"f\" action=\"Produit\">");
		out.println("<fieldset style=\"width: 500px\">");
		out.println("<legend>Choisir un nom</legend>");
		out.println("<label>Produits</label> ");
		out.println("<select name=\"Produit\"  >"); 
		out.println("	<option value='-1'>Aucun</option>");
		
			resultat=connexion.getData("select CODEPRODUIT,NOMCOMMERCIAL from Produit");
			for(int i=0;i<resultat.size();++i)
			{
	  			resultat_final=(Vector)resultat.elementAt(i);
				out.println("<option value=\""+resultat_final.elementAt(0)+"\" >"+resultat_final.elementAt(1)+"</option>");
			}
		 
		out.println("</select>"); 
		out.println("<div id='Produit' >"); 
		out.println("<table width=100%>");
		out.println("<br>");
		
			 /*resultat=connexion.getData("SELECT IMGPROD FROM imageproduit WHERE ID_IMG IN (SELECT ID_IMG FROM aune WHERE CODEPRODUIT="+request.getParameter("Produit")+")");	
			/Vector resultat_final1=(Vector)resultat.elementAt(0);*/
			 
			resultat=connexion.getData("SELECT p1. * , i1.IMGPROD FROM imageproduit i1, produit p1, aune a1 WHERE p1.CODEPRODUIT = a1.CODEPRODUIT AND a1.ID_IMG = i1.ID_IMG and p1.codeproduit="+request.getParameter("Produit"));
			 for(int i=0;i<resultat.size();++i)
			 {
				 resultat_final=(Vector)resultat.elementAt(i);
				out.println("<tr><th>Code Produit</th><td>"+resultat_final.elementAt(0)+"</td></tr>");
				out.println("<tr style=\"background-color:#DAFAC9;\"><th>Code Stock</th><td>"+resultat_final.elementAt(1)+"</td></tr>");
				out.println("<tr><th>Nom</th><td>"+resultat_final.elementAt(2)+"</td></tr>");
				out.println("<tr style=\"background-color:#DAFAC9;\"><th>Matière Active</th><td>"+resultat_final.elementAt(3)+"</td></tr>");
				out.println("<tr><th>Molécule</th><td>"+resultat_final.elementAt(4)+"</td></tr>");
				out.println("<tr style=\"background-color:#DAFAC9;\"><th>Code Fournisseur</th><td>"+resultat_final.elementAt(5)+"</td></tr>");
				out.println("<tr><th>Image</th><td><img src="+resultat_final.elementAt(6)+"></td></tr>");
			 }
			
	
	out.println("</table>");
	out.println("</div>");
	out.println("<input type=\"submit\" value=\"afficher\" style=\"color:Black;border-color:#669900;border-style:Groove;height:22px;width:147px;\" >");
	out.println("</fieldset>");
	out.println("</form>");
	out.println("</body>");
	request.getRequestDispatcher("Agent/menu.jsp").include(request,response);
	request.getRequestDispatcher("Agent/pied.jsp").include(request,response);
	out.println("</html>");
}
}