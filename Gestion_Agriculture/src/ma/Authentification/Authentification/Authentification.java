package ma.Authentification.Authentification;
import java.sql.SQLException;
import java.util.Vector;
import ma.connexion.Connect;
public class Authentification {
public Vector resultat;
Connect connexion=new Connect();
public Authentification(String login,String password) throws SQLException
	{
		
			resultat=connexion.getData("SELECT * FROM user WHERE ID='"+login+"' AND PASSWORD='"+password+"'");
		
	}
}