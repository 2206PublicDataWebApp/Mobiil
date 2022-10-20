<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	var msg = "<c:out value='${msg}'></c:out>"
	var url = "<c:out value='${url}'></c:out>"
	alert(msg);
	location.href = url;
</script>
	
</body>
</html>