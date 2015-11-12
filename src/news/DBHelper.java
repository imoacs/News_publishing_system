package news;
import java.sql.*;  	  
	public class DBHelper {
		private static final String driver = "com.mysql.jdbc.Driver";  
	    private static final String url = "jdbc:mysql://127.0.0.1:3307/user";  
	    private static final String user = "root";  
	    private static final String password = "010203";
	    private static Connection conn = null;  
	    private static Statement stmt = null;
	    static{
	    		try{
	    			Class.forName(driver);
	    		}
	    		catch (Exception e) {  
	    			e.printStackTrace();  
	    		} 
	    }
	    public static Connection getConnection() throws Exception  {
	    		if(conn==null){
	    			conn = DriverManager.getConnection(url, user, password);
	    			return conn;
	    		}
	    		return conn;
	    }
	    public static ResultSet Query(String sql){
	    		try {
	    			stmt = conn.createStatement();
	    		}
	    		catch (SQLException e) {
	    			e.printStackTrace();
	    		}
	        ResultSet rs = null;
			try {
				rs = stmt.executeQuery(sql);
			} 
			catch (SQLException e) {
				e.printStackTrace();
			}
			return rs;
	    }
	    public static void close() {  
	        try {
	        		stmt.close();
	            conn.close();
	        } catch (SQLException e) {  
	            e.printStackTrace();  
	        }  
	    }  
	}  
