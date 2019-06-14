<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE HTML PUBLIC "-//w3c//dtd html 4.0 transitional//en">

<jsp:include page="database.jsp"></jsp:include>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>사원 등록</title>
</head> 
<body bgcolor="#ffffff">
	
<sql:update dataSource="${ds}" var="customer">
    UPDATE customer SET id=?, name=?, pw=PASSWORD(?), birth=?, cell_num=?, email=? WHERE sn=${param.sn}
    <sql:param value='${param["id"]}'/>
    <sql:param value='${param["name"]}'/>
    <sql:param value='${param["pw"]}'/>
    <sql:param value='${param["birth"]}'/>
    <sql:param value='${param["cell_num"]}'/>
    <sql:param value='${param["email"]}'/>
    
</sql:update>

<jsp:include page="list.jsp"></jsp:include>

</body>
</html>