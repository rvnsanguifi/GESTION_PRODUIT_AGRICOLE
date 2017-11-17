import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ma.connexion.Connect;

/**
 * Servlet implementation class modifier_password
 */
public class modifier_password extends HttpServlet {
	private static final long serialVersionUID = 1L;
      Connect connexion=new Connect();
      HttpSession session;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modifier_password() {
        super();
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
		String mdp1=request.getParameter("mdp1");
		String mdp2=request.getParameter("mdp2");
		String old_passwd=request.getParameter("old_passwd");
		session=request.getSession(true);
		String nom=(String) session.getAttribute("attribut3");
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		out.println("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">");
		out.println("<title>Modification du mot de passe</title>");
		out.println("<link href=\"css/styles.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("<link href=\"css/menu1.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />");
		out.println("</head>");
		out.println("<body>");
		request.getRequestDispatcher(nom+"/en_tete.jsp").include(request,response);
		if(mdp1=="" && mdp2=="" && old_passwd=="" )
		{
			out.println("tous les champs sont obligatoire");
		}
		try{
			connexion.setData("update user set PASSWORD='"+mdp1+"' where ID='"+session.getAttribute("attribut0")+"'");
			out.println("votre mot de passe a  été modifié avec succées");
			session.setAttribute("attribut1", mdp1);
		}catch(Exception e)
		{
			e.getMessage();
		}
		out.println("</body>");
		request.getRequestDispatcher(nom+"/menu.jsp").include(request,response);
		request.getRequestDispatcher("pied.jsp").include(request,response);
		out.println("</html>");
	}

}
