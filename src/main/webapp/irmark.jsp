
       <%@page import="javax.xml.*" %>
	   <%@page import="org.bouncycastle.util.encoders.Base64" %>
	   <%@page import="org.w3c.dom.Document" %>
	   <%@page import="com.consleague.*" %>
       <%
	      String xml[] = request.getParameterValues("test");
                   IRMarkCalculator mc= new IRMarkCalculator();                  
       out.println(mc.getIRRequest(xml[0],"test"));
      // mc.getIRRequest(xml[0],"test");
	   %>
	  