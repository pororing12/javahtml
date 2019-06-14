<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE HTML PUBLIC "-//w3c//dtd html 4.0 transitional//en">

<jsp:include page="database.jsp"></jsp:include>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>사원 리스트</title>
</head> 
<body bgcolor="#ffffff">
	
<sql:update dataSource="${ds}" var="customer">
    DELETE from customer WHERE sn=${param.sn}
</sql:update>

<jsp:include page="list.jsp"></jsp:include>

</body>
</html>