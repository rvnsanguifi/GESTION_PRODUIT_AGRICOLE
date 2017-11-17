package com.chef_dexp.parcelle;
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
 * Servlet implementation class Parcelle
 */
public class Parcelle extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Vector resultat;
	public Vector resultat_final;
	public Connect connexion=new Connect();
	/**
     * Default constructor. 
     */
    public Parcelle() {
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
		out.println("<title>Consultation des Acheteurs</title>");
		out.println("<link href=\"css/styles.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("<link href=\"css/menu1.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("<link href=\"css/table.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("</head>");
		out.println("<body>"); 
		request.getRequestDispatcher("chef d'exploitation/en_tete.jsp").include(request,response);
		out.println("<h1>Voici la liste des Parcelles </h1>");
		out.println("<form name=\"f\" action=\"Parcelle\">");

		out.println("<fieldset style=\"width: 500px\">");
		out.println("<legend>listes des Parcelles</legend>");
		
		out.println("<table cellspacing=0 cellpadding=4 rules=all  border=1 style=\"background-color:White;border-color:#3366CC;border-width:1px;border-style:None;width:500px;border-collapse:collapse;\">");
		out.println("<br>");
		out.println("<tr style=\"color:#CCCCFF;background-color:#003399;font-weight:bold;\">");
		out.println("<th scope=col>Code de Parcelle</th>");
		out.println("<th>Nom d'Exploitation</th>");
		out.println("<th>Nombre de serres</th>");
		out.println("<th>Surface en Km</th>");
		out.println("<th>Surface cultivée</th>");
		out.println("<th>Surface non cultivée</th>");
		out.println("</tr>");
		
	resultat=connexion.getData("SELECT codeparcelle, nomferme, NBSERRE, SURFACE, SURFACECULTIVE, SURFACENCULTIVE FROM `Parcelle`INNER JOIN ferme ON parcelle.codeferme = ferme.codeferme ");
			 
	for(int i=0;i<resultat.size();++i)
	 {
		 resultat_final=(Vector)resultat.elementAt(i);
				out.println("<tr>");
				out.println("<td>"+resultat_final.elementAt(0)+"</td>");
				out.println("<td>"+resultat_final.elementAt(1)+"</td>");
				out.println("<td>"+resultat_final.elementAt(2)+"</td>");
				out.println("<td>"+resultat_final.elementAt(3)+"</td>");
				out.println("<td>"+resultat_final.elementAt(4)+"</td>");
				out.println("<td>"+resultat_final.elementAt(5)+"</td>");
				out.println("</tr>");
		}
			
	
	out.println("</table>");
	out.println("</fieldset>");
	out.println("</form>");
	out.println("</body>");
	request.getRequestDispatcher("chef d'exploitation/menu.jsp").include(request,response);
	request.getRequestDispatcher("pied.jsp").include(request,response);
	out.println("</html>");
}
}