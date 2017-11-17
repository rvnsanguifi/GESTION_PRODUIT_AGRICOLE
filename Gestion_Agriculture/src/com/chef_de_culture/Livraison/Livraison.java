package com.chef_de_culture.Livraison;

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
 * Servlet implementation class Livraison
 */
public class Livraison extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Vector resultat;
	public Vector resultat_final;
	public Connect connexion=new Connect();
	/**
     * Default constructor. 
     */
    public Livraison() {
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
		request.getRequestDispatcher("chef de culture/en_tete.jsp").include(request,response);
		out.println("<h1>Voici la liste des Livraisons </h1>");
		out.println("<table cellspacing=0 cellpadding=4 rules=all  border=1 style=\"background-color:White;border-color:#3366CC;border-width:1px;border-style:None;width:500px;border-collapse:collapse;\">");
		out.println("<br>");
		out.println("<tr style=\"color:#CCCCFF;background-color:#003399;font-weight:bold;\">");
		out.println("<th>Numéro de Livraison</th>");
		out.println("<th>Code de Culture</th>");
		out.println("<th>date de Livraison</th>");
		out.println("<th>Poid Net</th>");
		out.println("<th>Nombre de Gajette</th>");
		out.println("<th>Code de Transporteur</th>");
		out.println("</tr>");
		
	resultat=connexion.getData("SELECT * from livraison ");
		 
				for(int i=0;i<resultat.size();++i)
				{
					resultat_final=(Vector)resultat.elementAt(i);
					out.println("<tr>");
					for(int j=0;j<resultat_final.size();j++)
					{
					out.println("<td>"+resultat_final.elementAt(j)+"</td>");
				}
				out.println("</tr>");
				}
			
	
	out.println("</table>");
	out.println("</form>");
	out.println("</body>");
	request.getRequestDispatcher("chef de culture/menu.jsp").include(request,response);
	request.getRequestDispatcher("pied.jsp").include(request,response);
	out.println("</html>");
}
}