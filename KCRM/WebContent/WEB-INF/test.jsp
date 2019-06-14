<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<fmt:setLocale value="ko_KR"/>

<jsp:useBean id="now" class="java.util.Date"/>
${now} <br>
<fmt:formatDate value="${now}" type="date" pattern="yyyy년MM월dd일"/> <br>

<c:forEach var="i" begin="2" end = "9">
	<c:forEach var="j" begin="1" end = "9">
	${i} * ${j} = ${i*j} <br>
	</c:forEach>
</c:forEach>

</body>
</html>