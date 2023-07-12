<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>





<%
String myPath = request.getContextPath();
request.setAttribute("myPath", myPath);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<jsp:include page="navbar.jsp" />


<body>

<h1>332e: ${myPath}</h1> 
<h1>332e: ${myPath}</h1> 
<h1>332e: ${myPath}</h1> 
<h1>332e: ${myPath}</h1> 
<h1>332e: ${myPath}</h1> 
	QQQQ 這是中文
	

<jsp:include page="footer.jsp" />
</body>
</html>