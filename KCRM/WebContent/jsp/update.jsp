<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%request.setCharacterEncoding("euc-kr"); %>

<c:set var="reg_or_upt" value="등록"/>
<c:if test="${param.sn ne null}">
	<c:set var="reg_or_upt" value="수정"/>
	
	<jsp:include page="database.jsp"></jsp:include>
	
	<sql:query sql="select * from customer where sn=?" var="rs" dataSource="${ds}">
		<sql:param value="${param.sn}" />
	</sql:query>
	
</c:if>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>고객 ${reg_or_upt}</title>
<link href="css/layout.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">

function update() {
	var form = document.joinForm;
	
	//if(email_id.value != "")
	//	form.email.value = email_id.value + "@" + form.email_cust.value;
	
	//form.cell_num.value = form.emppcs1.value+"-"+form.emppcs2.value+"-"+form.emppcs3.value;
	
	form.submit();
}

function onMailChanged(slt) {
	var form = document.joinForm;
	var opts = slt.options;
	var idx = slt.selectedIndex;
	form.email.value = email_id.value + "@";
	
	if(idx=="0") {
		form.email.value += form.email_cust.value;
	} else {
		form.email.value += opts[idx].text; 
	}
}


</script>


</head>
<body style="margin-left: 50px;">
		<div class="hs20"></div>
		<h3>고객${reg_or_upt}</h3>
		
<form id="joinForm" name="joinForm" action="updateAction.jsp" method="post">
	<input id="sn" name="sn"  value="${param.sn}" type="hidden" />
	<table width="745" border="0" cellpadding="0" cellspacing="0" class="defTable_02"  >
		<colgroup>
		<col width="110px;" />
		<col width="" />
		<col width="" />
		<col width="" />
		</colgroup>
		<tbody>
		
		<c:forEach var="row" items="${rs.rows}">
			<input id="email" name="email"  value="${row.email}" type="hidden" />
			<input id="cell_num" name="cell_num"  value="${row.cell_num}" type="hidden" />
			<tr>
				<th class="tit">아이디</th>
				<td colspan="3" class="tit_02 last">
					<input id="id" name="id" type="text" value="${row.id}" class="w80 fl" style="ime-mode:disabled; text-transform:lowercase;" maxlength="16" />
				</td>
			</tr>
			<tr>
				<th class="cell al_C">비밀번호</th>
				<td class="last">
					<input id="pw" name="pw" type="password" class="wFulll" maxlength="20" />
				</td>
				<th class="cell al_C">비밀번호 확인</th>
				<td class="last">
					<input id="pw_c" name="pw_c" type="password" class="wFulll" maxlength="20" />
				</td>
			</tr>
			<tr>
				<th class="cell al_C ">성명</th>
				<td class="last">
					<input id="name" name="name" value="${row.name}" type="text" class="wFulll"  maxlength="10"/>
				</td>
				<th colspan="-1">생년월일</th>
				<td colspan="-1" class="last">
					<input name="birth" value="${row.birth}" type="text" class="w80 fl" id="birth" maxlength="8" onkeypress="return number_check();" />
				</td>
			</tr>
			<tr>
			<th class="cell al_C ">E-mail</th>
				<td class="last">
					<input type="text" name="email_id" id="email_id" class="w150" style="ime-mode:disabled" maxlength="15"/>@
						
						<select name="email_portal" id="email_portal" onchange="javascript:onMailChanged(this)">
							<option value="write" >직접입력</option>						
							<option value="naver.com" >naver.com</option>
							<option value="daum.net" >daum.net</option>
							<option value="paran.com" >paran.com</option>
							<option value="nate.com" >nate.com</option>
							<option value="yahoo.co.kr" >yahoo.co.kr</option>
							<option value="hanmail.net" >hanmail.net</option>
							<option value="hotmail.com" >hotmail.com</option>
							<option value="lycos.co.kr" >lycos.co.kr</option>
						</select>
						
					<input type="text" name="email_cust" id="email_cust" size="15" value="" style= />
				</td>
				
				<th class="last">휴대폰번호</th>
				<td class="last">
					<input name="emppcs1" type="text" class="w50 fl" id="emppcs1"  onkeypress="return number_check();" maxlength="3"  style="ime-mode:disabled;"/>
					<span class="fl pd2">-</span>
					<input name="emppcs2" type="text" class="w50 fl" id="emppcs2"  onkeypress="return number_check();" maxlength="4"  style="ime-mode:disabled;"/>
					<span class="fl pd2">-</span>
					<input name=emppcs3 type="text" class="w50 fl" id="emppcs3"  onkeypress="return number_check();" maxlength="4"  style="ime-mode:disabled;"/>
				</td>
			</tr>
			
			<script>
				var email = document.getElementById("email").value;
				var cell_num = document.getElementById("cell_num").value;
				
				if(email!=null || email!="") {
					document.getElementById("email_id").value = email.split("@")[0];
					document.getElementById("email_portal").value = email.split("@")[1];
					if(document.getElementById("email_portal").selectedIndex<0)
						document.getElementById("email_cust").value = email.split("@")[1];
				}
				
				if(cell_num!=null || cell_num!="") {
					if(cell_num.split("-").size==3) {
						document.getElementById("emppcs1").value = cell_num.split("-")[0];
						document.getElementById("emppcs2").value = cell_num.split("-")[1];
						document.getElementById("emppcs3").value = cell_num.split("-")[2];
					}
				}
				
				
			</script>
			
		</c:forEach>

		</tbody>
	</table>
		<div class="hs20"></div>		
		<table width="745" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td width="50%" align="left"></td>
				<td width="50%" align="right">
					<button class="button white medium" type="button"   onclick="javascript:update();">
						수정
					</button>
					<button class="button white medium" type="button"   onclick="javascript:window.location.href='list.jsp'">
						취소
					</button>
				</td>			
			</tr>
		</table>	
</form>
</body>
</html>