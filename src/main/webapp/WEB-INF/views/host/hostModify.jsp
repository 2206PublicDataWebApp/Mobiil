<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȣ��Ʈ ���� ������</title>

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
		<form action="/host/hostInfo.mobiil" method="get">
			<table>
				<tr>
					<td id="td">��ǥ�ڸ�   :</td>
					<td>
					<input type="text" id="name" name="name" size="31" placeholder="������ ��ǥ�ڸ��� �Է����ּ���.">
					</td>
				</tr>
				<tr>
					<td id="td">��ȣ��   :</td>
					<td>
					<input type="text" id="business_name" size="31" name="business_name" placeholder="������ ��ȣ���� �Է����ּ���.">
					</td>
				</tr>
				<tr>
					<td id="td">����ó   :</td>
					<td>
					<input type="text" id="phone" name="phone" size="31" placeholder="������ ����ó�� �Է����ּ���.">
					</td>
				</tr>
				<tr>
					<td id="td">����� ��Ϲ�ȣ   :</td>
					<td>
					<input type="text" id="businessNo" name="businessNo" size="31" placeholder="������ ����� ��Ϲ�ȣ�� �Է����ּ���.">
					</td>
				</tr>
				<tr>
					<td id="td">�����   :</td>
					<td>
					<input type="text" id="bankName" name="bankName" size="31" placeholder="������ ������� �Է����ּ���.">
					</td>
				</tr>
				<tr>
					<td id="td">Email   :</td>
					<td>
					<input type="text" id="Email" name="Email" size="31" placeholder="������ �̸����� �Է����ּ���.">
					</td>
				</tr>
				<tr>
					<td>����� �����</td>
					<td><div><input type="image" src="" alt="����ڵ����">	</div></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<br><br>
						<input type="submit" value="�����ϱ�">
						<input type="reset"  value="���">
					</td>
				</tr>
			</table>
		</form>
		</div>
</body>
</html>