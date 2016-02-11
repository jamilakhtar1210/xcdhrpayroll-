<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import ="java.net.URI" %>
<%@ page import ="java.util.*"%>
<%@ page import ="java.net.URISyntaxException"%>
<%@ page import ="java.sql.*"%>

<%@ page import ="com.sforce.soap.partner.GetUserInfoResult" %>
<%@ page import ="com.sforce.soap.partner.PartnerConnection" %>

<%@ page import ="com.sforce.ws.ConnectionException" %>
<%@ page import ="com.sforce.ws.ConnectorConfig" %>
<%@ page import =" com.sforce.ws.*" %>
<%@ page import ="com.sforce.soap.partner.QueryResult"%>
<%@ page import =" com.sforce.soap.partner.sobject.SObject" %>

<%@ page import ="com.consleague.PostgressDB" %>
<%@ page import ="com.consleague.SalesForceConnection" %>


<%
out.println("Hello Heroku Arbinda And jamil");

PostgressDB db=null;
Connection connection;
SalesForceConnection sfconn=null;
PartnerConnection pcon;

    try{
 
 	   connection=db.getConnection();
 	   if(connection!=null){
 		   out.print("Postgress connected: ");  
 	   }else{
 		   out.print("Postgress not connected: "); 
 	   }
 	   System.out.println("before connection: ");
 	   pcon=sfconn.SFConnection("jar25th@yahoo.com","Jamil1234","llWCJcm82JVWx0XGjHT0dFTb3","https://login.salesforce.com/services/Soap/u/29.0/");
        if(pcon!=null)
        {
        	out.println(" Sales force connected");
        	   //List listAcc = new ArrayList();
        	  // SObject s=queryContacts(pcon);
        	   //listA =createTable(listAcc);
        	  QueryResult queryResults = pcon.query("SELECT id,Name,AccountNumber,Description FROM Account "); 
        	 
        	  %>
              <Table border="1">
              		<TH>ID</TH><TH>Name</TH><TH>AccountNumber</TH><TH>Description</TH>
              <%		
        	  for (SObject s: queryResults.getRecords()) {
                %>
                <tr><td><%=s.getId() %></td><td><%= (String)s.getField("Name") %></td><td><%=(String)s.getField("AccountNumber") %></td><td><%= (String)s.getField("Description") %></td><tr>
        		<% 
        	   }
              %>
              </table>
              
      <%        
        }	   
        else
        	out.println(" Salesforce not connected");

        
    }
    catch (URISyntaxException e)
    {
 	  // out.write("Error in connection".getBytes());
 	   e.getMessage();
    }
    catch (SQLException sql)
    {
 	  // out.write("Error in connection".getBytes());
 	   sql.getMessage();
    }
    
    catch (ConnectionException exe) 
    {
 	   exe.printStackTrace();
 	  // exe.getMessage();
    }
    
    // out.flush();
    // out.close();

%>