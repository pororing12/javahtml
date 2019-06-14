<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE HTML PUBLIC "-//w3c//dtd html 4.0 transitional//en">
<%
	request.setCharacterEncoding("euc-kr");
%>
<c:if test="${ds eq null}">
	<sql:setDataSource url="jdbc:mysql://localhost:3306/bcontdb?serverTimezone=UTC"
		driver="com.mysql.jdbc.Driver" user="bcont" password="bcont"
		var="ds" scope="session" />
</c:if>

