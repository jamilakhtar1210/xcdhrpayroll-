<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>First OAuth Application</title>
</head>
<body bgcolor="#5F9EA0">
<script type="text/javascript" language="javascript">
    if (location.protocol != "https:") {
        document.write("OAuth will not work correctly from plain http. "+
                "Please use an https URL.");
    } else {
        document.write("<a href=\"https://54.149.187.27:8443/OAuthServlet/\">Click here to retrieve contacts from Salesforce via OAuth.</a>");
    }
</script>
<center>
	 <h2>MetaData reader</h2> 
	 <form action="https://54.149.187.27:8443/OAuthServlet/" method="GET"> 
	
	 <!--
	 <select name="metadata">
		  <option value="volvo">MetaData</option>
		  <option value="saab">Saab</option>
		  <option value="mercedes">Mercedes</option>
		  <option value="audi">Audi</option>
	</select>
	<select name="version">
			<option value="v32.0">32.0</option>
			<option value="v31.0">31.0</option>
			<option value="v30.0">30.0</option>
			<option value="v29.0">29.0</option>
			<option value="v28.0">28.0</option>

	</select>
	-->	
     <br/>
	 <!--
	 <input type="radio" name="server" value="https://login.salesforce.com/services/Soap/u/29.0/">Production 
	 <input type="radio" name="environment" value="https://login.salesforce.com">Production
     <!--<input type="radio" name="server" value="https://test.salesforce.com/services/Soap/u/29.0/">Sandbox 
	<input type="radio" name="environment" value="https://test.salesforce.com">Sandbox	
    -->	
	 <br/><input type="submit" value="Submit"> 
	 </form> 
 </center> 
</body>
</html>