import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ma.Authentification.Authentification.Authentification;
import ma.connexion.Connect;

/**
 * Servlet implementation class connexion
 */
public class connexion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       String login1=null;
       String password1=null;
       String login2=null;
       String password2=null;
       String role=null;
       String email=null;
       String nom=null;
       String grade=null;
       HttpSession session;
       Vector resultat_final;
       /**
     * @see HttpServlet#HttpServlet()
     */
    public connexion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    public void init() throws ServletException {
		 new Connect();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		session=request.getSession(true);
		login1 = request.getParameter("login");
		password1 =request.getParameter("password");
		
		try
		{
			if (login1.equals("") || password1.equals("")) 
				{
					request.getRequestDispatcher("index.jsp").include(request,response);
			    }

			else
			{
				Authentification id = new Authentification(login1,password1);
				int a=0;
				Enumeration e = id.resultat.elements();
				while(e.hasMoreElements()){
					for(int k=0;k<id.resultat.size();++k)
					{
						resultat_final=(Vector)id.resultat.elementAt(k);
					
					login2 = resultat_final.elementAt(0).toString();
					password2 = resultat_final.elementAt(1).toString();
					email=resultat_final.elementAt(2).toString();
					role=resultat_final.elementAt(3).toString();
					nom=resultat_final.elementAt(4).toString();
					grade=resultat_final.elementAt(5).toString();}
					for(int i=0;i<6;++i)
					{
						session.setAttribute("attribut"+i, resultat_final.elementAt(i));
					}
					
					if(login1.equals(login2) || password1.equals(password2)){
						 a=1;
						
						break;
						}
				}
				      if(a==1){
					out.println(login2);
					 if(role.equals("admin"))
					 {
						 response.sendRedirect("admin/index.jsp");

					 }
					 else if(role.equals("Agent"))
					 {
						 response.sendRedirect("Agent/index.jsp");
					 }
					 else if(role.equals("chef de culture"))
					 {
						 response.sendRedirect("chef de culture/index.jsp");
					 }
					 else if(role.equals("chef d'exploitation"))
					 {
						 response.sendRedirect("chef d'exploitation/index.jsp");
					 }
			      }
				
			      else{
			    	  	response.sendRedirect("se connecter.jsp");
			      }
				}
				
			}catch(Exception e)
			{
				e.printStackTrace();
			}
			String b=request.getParameter("b");   
			  if(b!=null && b.equals("decon")){ 
			     request.getSession();
				  session.invalidate();
			     }
	}
	 

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

}
