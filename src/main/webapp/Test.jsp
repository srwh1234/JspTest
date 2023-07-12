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
<body>

<h1>33: ${myPath}</h1> 

	QQQQ 這是中文
	


</body>
</html>