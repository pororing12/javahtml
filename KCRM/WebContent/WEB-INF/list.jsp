<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE HTML PUBLIC "-//w3c//dtd html 4.0 transitional//en">


<jsp:include page="database.jsp"></jsp:include>

<sql:query sql="select * from customer" var="rs" dataSource="${ds}" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�� ����Ʈ</title>
<link href="css/layout.css" rel="stylesheet" type="text/css" />
</head> 
<body style="margin-left: 50px;">

		<div class="hs20"></div>
		<h3>�� ����Ʈ</h3>
		<div class="hs10"></div>
	<table width="745" border="0" cellpadding="0" cellspacing="0" class="defTable_02"  >
		<colgroup>
			<col width="110px;" />
			<col width="" />
			<col width="" />
			<col width="" />
			<col width="" />
		</colgroup>
		<thead>
		    <tr>
		      <th class="tit">���̵�</th>
		      <th class="tit">�̸�</th>
		      <th class="tit">�������</th>
		      <th class="tit">�ڵ�����ȣ</th>
		      <th class="tit">�̸���</th>
		    </tr>
  		</thead>
		<tbody>
			<c:forEach var="row" items="${rs.rows}">
				<tr onclick="window.document.location='view.jsp?sn=${row.sn}';" style="cursor: pointer;">
					<td class="last"><c:out value="${row.id}" /></td>
					<td class="last"><c:out value="${row.name}" /></td>
					<td class="last"><c:out value="${row.birth}" /></td>
					<td class="last"><c:out value="${row.cell_num}" /></td>
					<td class="last"><c:out value="${row.email}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
		<div class="hs20"></div>		
		<table width="745" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td width="50%" align="left"></td>
				<td width="50%" align="right">
					<button class="button white medium" type="button" onclick="javascript:window.location.href='regist.jsp'">
						���
					</button>
				</td>			
			</tr>
		</table>	
</body>
</html>