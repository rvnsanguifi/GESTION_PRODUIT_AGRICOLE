package com.chef_dexp.Commissionnaire;

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
 * Servlet implementation class Commissionnaire
 */
public class Commissionnaire extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Vector resultat;
	public Vector resultat_final;
	public Connect connexion=new Connect();
	/**
     * Default constructor. 
     */
    public Commissionnaire() {
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
		out.println("<title>Consultation des Commissionnaires</title>");
		out.println("<link href=\"css/styles.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("<link href=\"css/menu1.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("<link href=\"css/table.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("</head>");
		out.println("<body>");
		request.getRequestDispatcher("chef d'exploitation/en_tete.jsp").include(request,response);
		out.println("<h1>Voici la liste des Commissionnaires </h1>");
		out.println("<form name=\"f\" action=\"Commissionnaire\">");

		out.println("<fieldset style=\"width: 500px\">");
		out.println("<legend>Choisir un nom</legend>");
		out.println("<label>Commissionnaires</label> ");
		out.println("<select name=\"commissionnaire\"  >"); 
		out.println("<option value='-1'>Aucun</option>");
		 
			resultat=connexion.getData("select codecom,nom from commissionnaire");
			for(int i=0;i<resultat.size();++i)
			{
				resultat_final=(Vector)resultat.elementAt(i);
				out.println("<option value=\""+resultat_final.elementAt(0)+"\">"+resultat_final.elementAt(1)+"</option>");
			}
			
		out.println("</select>"); 
		out.println("<div id='Commissionnaire' >"); 
		out.println("<table border=1 width=100% bordercolor=black> ");
		out.println("<br>");
	
			
			 resultat=connexion.getData("SELECT * FROM commissionnaire WHERE codecom="+request.getParameter("commissionnaire")+" ORDER BY nom");
			 
			 for(int i=0;i<resultat.size();++i)
				{
					resultat_final=(Vector)resultat.elementAt(i);
				
				
					out.println("<tr><th>Code du Commissionnaire</th><td>"+resultat_final.elementAt(0)+"</td></tr>");
					out.println("<tr style=\"background-color:#DAFAC9;\"><th>Nom du Commissionnaire</th><td>"+resultat_final.elementAt(1)+"</td></tr>");
					out.println("<tr><th>Societé</th><td>"+resultat_final.elementAt(2)+"</td></tr>");
					out.println("<tr style=\"background-color:#DAFAC9;\"><th>Adresse</th><td>"+resultat_final.elementAt(3)+"</td></tr>");
					out.println("<tr><th>Adresse Email</th><td>"+resultat_final.elementAt(4)+"</td></tr>");
					out.println("<tr style=\"background-color:#DAFAC9;\"><th>Numero de Fax</th><td>"+resultat_final.elementAt(5)+"</td></tr>");
					out.println("<tr><th>Numero de Telephone</th><td>"+resultat_final.elementAt(6)+"</td></tr>");
					out.println("<tr style=\"background-color:#DAFAC9;\"><th>Patente</th><td>"+resultat_final.elementAt(8)+"</td></tr>");
					out.println("<tr><th>Informations</th><td><textarea name=Acheteur  width=100% disabled style=\"height:91px;width:400px;margin-bottom: 0px\">"+resultat_final.elementAt(7)+"</textarea></td></tr>");
				
				}
			
	
	out.println("</table>");
	out.println("</div>");
	out.println("<input type=\"submit\" value=\"afficher\" style=\"color:Black;border-color:#669900;border-style:Groove;height:22px;width:147px;\">");
	out.println("</fieldset>");
	out.println("</form>");
	out.println("</body>");
	request.getRequestDispatcher("chef d'exploitation/menu.jsp").include(request,response);
	request.getRequestDispatcher("pied.jsp").include(request,response);
	out.println("</html>");
}
}