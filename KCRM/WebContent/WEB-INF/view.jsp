<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:include page="database.jsp"></jsp:include>

<sql:query sql="select * from customer where sn=?" var="rs" dataSource="${ds}">
	<sql:param value="${param.sn}" />
</sql:query>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>고객 정보</title>
<link href="css/layout.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">

function delete_cust() {
	var form = document.custForm;
	form.action = "delete.jsp";
	form.submit();
}

function update_cust() {
	var form = document.custForm;
	form.action = "update.jsp";
	form.submit();
}


</script>


</head>
<body>
<body style="margin-left: 50px;">

		<div class="hs20"></div>
		<h3>고객 상세 정보</h3>
		<div class="hs10"></div>
		
	<form id="custForm" name="custForm" action="list.jsp" method="post">
		<input id="sn" name="sn" type="hidden" value="${param.sn}" />
	</form>
		
	<table width="745" border="0" cellpadding="0" cellspacing="0" class="defTable_02"  >
		<colgroup>
		<col width="110px;" />
		<col width="" />
		<col width="" />
		<col width="" />
		</colgroup>
		<tbody>
			<c:forEach var="aCustomer" begin="0"
	            items="${rs.rowsByIndex}">
				<tr>				
					<th class="tit">아이디</th>
					<td colspan="3" class="tit_02 last">
						${aCustomer[1]}
					</td>
				</tr>
				<tr>
					<th class="cell al_C ">성명</th>
					<td class="last">
						${aCustomer[3]}
					</td>
					<th colspan="-1">생년월일</th>
					<td colspan="-1" class="last">
						${aCustomer[4]}
					</td>
				</tr>
				<tr>
					<th class="cell al_C ">E-mail</th>
					<td class="last">
						${aCustomer[6]}
					</td>
					
					<th class="last">휴대폰번호</th>
					<td class="last">
						${aCustomer[5]}
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="hs20"></div>		
	<table width="745" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="50%" align="left"></td>
			<td width="50%" align="right">
				<button class="button white medium" type="button"  onclick="javascript:update_cust();">
					수정
				</button>
				<button class="button white medium" type="button"   onclick="javascript:delete_cust();">
					삭제
				</button>
				<button class="button white medium" type="button"   onclick="javascript:document.custForm.submit();">
					리스트
				</button>
			</td>			
		</tr>
	</table>	
</body>
</html>