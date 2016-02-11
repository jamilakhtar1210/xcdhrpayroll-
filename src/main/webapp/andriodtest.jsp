<%@ page language="java"%>
<%@ page import="java.lang.*"%>
<%
          String username[] = request.getParameterValues("username");
	      String password[] = request.getParameterValues("password");
          if(username[0].equalsIgnoreCase("admin") && password[0].equalsIgnoreCase("password"))
          {              
       		out.println("Heroku server connected");
       	  }else
       	  {
       	  	out.println("Heroku server connection error");
       	  }	
      
	   %>