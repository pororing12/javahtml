<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%request.setCharacterEncoding("euc-kr"); %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>고객 등록</title>
<link href="css/layout.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">

function regist() {
	var form = document.joinForm;

	form.cell_num.value = form.emppcs1.value+"-"+form.emppcs2.value+"-"+form.emppcs3.value;
	
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
		<h3>고객 등록</h3>
		<div ><img src="images/icon_minus.png" alt="-" width="17" height="17" align="absmiddle"  class="pdR10" />(아이디 중복확인 버튼을 클릭하여 주시기 바랍니다.)</div>
		<div class="hs10"></div>	
		
<form id="joinForm" name="joinForm" action="registAction.jsp" method="post">

	<input id="email" name="email" type="hidden" />
	<input id="cell_num" name="cell_num" type="hidden" />
	<table width="745" border="0" cellpadding="0" cellspacing="0" class="defTable_02"  >
		<colgroup>
		<col width="110px;" />
		<col width="" />
		<col width="" />
		<col width="" />
		</colgroup>
		<tbody>
			<tr>
				<th class="tit">아이디</th>
				<td colspan="3" class="tit_02 last">
					<input id="id" name="id" type="text" class="w80 fl" style="ime-mode:disabled; text-transform:lowercase;" maxlength="16" />
					<img src="images/btn_innerCheck.png" alt="중복확인" width="73" height="20" onclick="javascript:repdIDCheck();" style="padding-right:465px; float: right; cursor:pointer;"/>
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
					<input id="name" name="name" type="text" class="wFulll"  maxlength="10"/>
				</td>
				<th colspan="-1">생년월일</th>
				<td colspan="-1" class="last">
					<input name="birth" type="text" class="w80 fl" id="birth" maxlength="8" onkeypress="return number_check();" />
				</td>
			</tr>
			<tr>
			<th class="cell al_C ">E-mail</th>
				<td class="last">
					<input type="text" name="email_id" id="email_id" class="w150" style="ime-mode:disabled" value="" maxlength="15"/>@
						
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
		</tbody>
	</table>
		<div class="hs20"></div>		
		<table width="745" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td width="50%" align="left"></td>
				<td width="50%" align="right">
					<button class="button white medium" type="button"   onclick="javascript:regist();">
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