package ma.connexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class Connect {
	Connection conn=null;
	Statement state=null;
	ResultSet result=null;
	
public Connect(){
		
		String Driver="org.gjt.mm.mysql.Driver";
		String url="jdbc:mysql://localhost/gfadatabase";
		
		//chargement de la classe Driver
		try{
			Class.forName(Driver);
		}
		catch(ClassNotFoundException e){
			System.out.println("la classe "+Driver+"est introuvable");
			e.printStackTrace();
		}
		// se connecter à la base des données 
		try{
			conn=DriverManager.getConnection(url,"root","");
			state = conn.createStatement();
			System.out.println("la connexion a réussi");
			}
		catch(SQLException sqle){
			System.out.println("Problème de Connexion");
		}
		
	}
// Ajout et modification des données

public void setData(String requette)
{
	try {
        state.executeUpdate(requette);
        Commit();
    	}
    catch (SQLException ex) {
       ex.getMessage();
    }

}
//recuperation des données
public Vector getData(String requet){
	Vector resultat_principal=new Vector();
    Vector resultat;
	resultat_principal.removeAllElements();
	     try {
	    	 result=state.executeQuery(requet);
	          ResultSetMetaData rsmd = result.getMetaData();
	          int nbCols = rsmd.getColumnCount();
	          boolean encore = result.next();

	          while (encore) {
	        	  resultat=new Vector();
	        	  
	        	  for (int i = 1; i <= nbCols; i++)
	        		  resultat.addElement(result.getString(i));
	            
	        	  resultat_principal.addElement(resultat);
	        	  resultat=null;
	        	  encore = result.next();
	          }
	          result.close();
	      } catch (SQLException e) {
	          System.out.println("erreur au niveau de getresultat(...)");
	      }
	      
	       
	return resultat_principal;
}
public void Commit() throws SQLException
{
	conn.commit();
}
public void close() throws SQLException {
	 //fermer la connexion
    result.close();
    state.close();
    conn.close();
}


}