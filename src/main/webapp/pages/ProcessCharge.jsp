<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Process Charge</title>
<LINK REL=StyleSheet HREF="../styles/style1.css" TYPE="text/css"
	MEDIA=screen>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap"
	rel="stylesheet">
	<style>
	.button {
  background-color: #FAAA17; /* Amazon Orange */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  
}
.button:hover{
cursor: pointer;
}
	</style>
</head>
<body>
	<div style="background-color: #9eadba;height:30px;padding-top: 0px;">
	</div>
	<div style="text-align: center;">
		<img src="../images/Amazon_Pay-Logo.wine.png"
			style="width: 250px; height: 150px; margin-top: -3%;"><br>
		<br>
	</div>
	<div style="margin-top: -5%;">
		<span style="font-family: 'Roboto', sans-serif;"><b>Send Payment Link</b></span><br>
	</div>
	<input type="text" readonly name="path"
		value="API: /v1/smart-store/payment/token/SMS" style="width: 250px;">
	<br>
	<br>

	<form action="/Amazon-Web/processCharge" method="POST" name="form1">
		<div>
		<div
			style="width: 40%; float: left;   margin: 10px; border-width: 1.75px; border-style: solid; border-color: #C8C8C8;">
			<span style="font-family: 'Roboto', sans-serif; "><b>List of all
				Parameters</b></span><br><br>
				Phone number&nbsp;<br><input type="text" name="phoneNumber" value="8976698602"><br><br>
				Amount:&nbsp;<br><input type="number" name="amount" value="10000" required><br><br>
				Sandbox:&nbsp;<br><input type="text" name="Sandbox" value="Y" required><br><br>
				<span style="font-family: 'Roboto', sans-serif; border: #C8C8C8; ">
				<b>Catalogue details</b></span><br><br>
				skuCode:&nbsp;<br><input type="number" name="skuCode" value="3126326" required><br><br>
				ASIN:&nbsp;<br><input type="number" name="ASIN" value="34284771" required><br><br>
				unitPrice:&nbsp;<br><input type="number" name="unitPrice" value="3" required><br><br>
				brand:&nbsp;<br><input type="text" name="brand" value="Samsung" required><br><br>
				productNote:&nbsp;<br><input type="text" name="productNote" value="Mobile" required><br><br>
				uniqueIdentifierStatus:&nbsp;<br><input type="text" name="uniqueIdentifierStatus" value="Valid" required><br><br>
				uniqueIdentifierType:&nbsp;<br><input type="text" name="uniqueIdentifierType" value="Flag" required><br><br>
				uniqueIdentifier:&nbsp;<br><input type="text" name="uniqueIdentifier" value="Flag" required><br><br>
				customerFriendlyBillPageMessage:&nbsp;<br><input type="number" name="customerFriendlyBillPageMessage" value="75742" required><br><br>
				transactionTimeout:&nbsp;<br><input type="text" name="transactionTimeout:" value="180" required><br><br>
				isLoyalCustomer:&nbsp;<br><input type="text" name="isLoyalCustomer" value="Y" required><br><br>
		
		<br>
		</div>
		<div
			style="width: 50%; height:300px; float: right;  border: #C8C8C8; border-width: 1.75px; border-style: solid; margin: 10px">
			<span style="font-family: 'Roboto', sans-serif;"><b>Request</b></span><br><br>
			<span id="request" style="word-break: break-word;">Request here</span>
		</div>
		
		<div
			style="width: 50%; height:300px; float: right;  border: #C8C8C8; border-width: 1.75px; border-style: solid; margin: 10px">
			<span style="font-family: 'Roboto', sans-serif;"><b>Response</b></span><br><br>
			<span id="response" style="word-break: break-word;">Response here</span>
		</div>
</div>
		<input type="submit" value="Send Payment Link" class="button">
	</form>
</body>
<script>
<%
String jsonRequest=(String)session.getAttribute("jsonRequest");
String jsonResponse=(String)session.getAttribute("jsonResponse");
%>
var jsonRequest='<%= jsonRequest%>';
var jsonResponse='<%= jsonResponse%>';

document.getElementById("request").innerHTML = jsonRequest;
document.getElementById("response").innerHTML = jsonResponse;

console.log(s);
</script>
</html>