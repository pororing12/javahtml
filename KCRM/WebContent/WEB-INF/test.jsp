<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<fmt:setLocale value = "ko_KR"/> // 한국 시간

<jsp:useBean id = "now" class = "java.util.Date"/> // 날짜 
${now}<br>
<fmt:formatDate value = "${now}" ype = "date" pattern = "YYYY��  MM�� dd��"/>
<c:forEach var = "i" begin = "2" end = "9">
	<c:forEach var = "j" begin = "1" end = "9">
	${i} * ${j} = ${i * j}<br> 
	</c:forEach>
</c:forEach>
</body>
</html>