package com.chef_dexp.Serre;
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
 * Servlet implementation class Serre
 */
public class Serre extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Vector resultat;
	public Vector resultat_final;
	public Connect connexion=new Connect();
	/**
     * Default constructor. 
     */
    public Serre() {
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
		out.println("<title>Consultation des Exploitations</title>");
		out.println("<link href=\"css/styles.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("<link href=\"css/menu1.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("<link href=\"css/table.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("</head>");
		out.println("<body>");
		request.getRequestDispatcher("chef d'exploitation/en_tete.jsp").include(request,response);
		out.println("<h1>Voici la liste des Serres </h1>");
		out.println("<fieldset>");
		out.println("<legend>Listes des Serres</legend>");
		out.println("<table style=\"background-color:White;border-color:#3366CC;border-width:1px;border-style:None;width:500px;border-collapse:collapse;\">");
		out.println("<br>");
		
			resultat=connexion.getData("SELECT s1.codeser,s1.codeparcelle,f1.nomferme,s1.surfaceserre FROM serre s1, ferme f1 WHERE s1.codeser IN (SELECT p1.codeparcelle FROM parcelle p1 WHERE p1.codeferme = f1.codeferme )");
			out.println("<tr style=\"color:#CCCCFF;background-color:#003399;font-weight:bold;\">");
			out.println("<th>Code de la Serre</th>");
			out.println("<th>Code de la Parcelle</th>");
			out.println("<th>Nom de la ferme</th>");
			out.println("<th>Surface</th>");
			out.println("</tr>"); 
			for(int i=0;i<resultat.size();++i)
			 {
				 resultat_final=(Vector)resultat.elementAt(i);
				out.println("<tr>");
				out.println("<td>"+resultat_final.elementAt(0)+"</td>");
				out.println("<td>"+resultat_final.elementAt(1)+"</td>");
				out.println("<td>"+resultat_final.elementAt(2)+"</td>");
				out.println("<td>"+resultat_final.elementAt(3)+"</td>");
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
