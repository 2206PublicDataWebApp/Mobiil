<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȣ��Ʈ ������</title>

<style>
	#td{
		text-align : right;
	}
	
	
</style>


</head>


<body>
	<jsp:include page="../host/menuBar.jsp"></jsp:include>

		<div id="div" align="center">
		<h2>�ȳ��ϼ���, OOO��</h2><br>
		<hr>
		
			<table>
				<tr>
					<td id="td">��ǥ�ڸ�   :</td>
					<td>
					<input type="text" id="name" name="name" readonly>
					</td>
				</tr>
				<tr>
					<td id="td">��ȣ��   :</td>
					<td>
					<input type="text" id="business_name" name="business_name" readonly>
					</td>
				</tr>
				<tr>
					<td id="td">����ó   :</td>
					<td>
					<input type="text" id="phone" name="phone" readonly>
					</td>
				</tr>
				<tr>
					<td id="td">����� ��Ϲ�ȣ   :</td>
					<td>
					<input type="text" id="businessNo" name="businessNo" readonly>
					</td>
				</tr>
				<tr>
					<td id="td">�����   :</td>
					<td>
					<input type="text" id="bankName" name="bankName" readonly>
					</td>
				</tr>
				<tr>
					<td id="td">Email   :</td>
					<td>
					<input type="text" id="Email" name="Email" readonly>
					</td>
				</tr>
			</table>


	<span>����� �����</span>
	
	<div>
		<input type="image" src="" alt="����ڵ����">	
	</div>
	

		</div>








</body>
</html>