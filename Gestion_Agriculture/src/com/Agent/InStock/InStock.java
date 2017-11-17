package com.Agent.InStock;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ma.connexion.Connect;
/**
 * Servlet implementation class InStocke
 */
public class InStock extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Vector resultat;
	public Vector resultat_final;
	public Connect connexion=new Connect();
	/**
     * Default constructor. 
     */
    public InStock() {
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
		out.println("<title>Consultation du Stocks Entrés</title>");
		out.println("<link href=\"css/styles.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("<link href=\"css/menu1.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("<link href=\"css/table.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("</head>");
		out.println("<body>");
		request.getRequestDispatcher("Agent/en_tete.jsp").include(request,response);
		out.println("<h1>Voici la liste des Stocks_Entrés </h1>");
		out.println("<form name=\"f\" action=\"InStock\">");
		out.println("<fieldset style=\"width: 500px\">");
		out.println("<legend>Choisir un Stock</legend>");
		out.println("<label>Stocks_Entrés</label> ");
		out.println("<select name=\"InStock\">"); 
		out.println("<option value='-1'>Aucun</option>");
		
			resultat=connexion.getData("select CODESTOCKE from InStocke");
			for(int i=0;i<resultat.size();++i)
			{
	  			resultat_final=(Vector)resultat.elementAt(i);
				out.println("<option value=\""+resultat_final.elementAt(0)+"\">"+resultat_final.elementAt(0)+"</option>");
			}
		out.println("</select>"); 
		out.println("<div id='InStock'>"); 
		out.println("<table>");
		out.println("<br>");
		
			
			 resultat=connexion.getData("SELECT * FROM InStocke WHERE CODESTOCKE="+request.getParameter("InStock"));
			 
			 for(int i=0;i<resultat.size();++i)
			 {
				 resultat_final=(Vector)resultat.elementAt(i);
					out.println("<tr><th >Code stock</th><td>"+resultat_final.elementAt(0)+"</td></tr>");
					out.println("<tr style=\"background-color:#DAFAC9;\"><th>Quantité</th><td>"+resultat_final.elementAt(1)+"</td></tr>");
					out.println("<tr><th>Magasin</th><td>"+resultat_final.elementAt(2)+"</td></tr>");
					out.println("<tr style=\"background-color:#DAFAC9;\"><th>Agent</th><td>"+resultat_final.elementAt(3)+"</td></tr>");
					out.println("<tr><th>Designiation</th><td>"+resultat_final.elementAt(5)+"</td></tr>");
					out.println("<tr style=\"background-color:#DAFAC9;\"><th>Etat</th><td>"+resultat_final.elementAt(6)+"</td></tr>");
					out.println("<tr><th>Date d'entré</th><td>"+resultat_final.elementAt(7)+"</td></tr>");
					out.println("<tr style=\"background-color:#DAFAC9;\"><th>Observation </th><td><textarea disabled style=\"height:91px;width:330px;margin-bottom: 0px\">"+resultat_final.elementAt(4)+"</textarea></td></tr>");
			
			 }
	out.println("</table>");
	out.println("</div>");
	out.println("<input type=\"submit\" value=\"afficher\" style=\"color:Black;border-color:#669900;border-style:Groove;height:22px;width:147px;\" >");
	out.println("</fieldset>");
	out.println("</form>");
	out.println("</body>");
	request.getRequestDispatcher("Agent/menu.jsp").include(request,response);
	request.getRequestDispatcher("pied.jsp").include(request,response);
	out.println("</html>");
}
}