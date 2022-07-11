<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Status</title>
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
		<span style="font-family: 'Roboto', sans-serif;"><b>Get Payment Status</b></span><br>
	</div>
	<input type="text" readonly name="path"
		value="API: /v1/smart-store/payment/charge/status" style="width: 250px;">
	<br>
	<br>

	<form action="/SmartStore/paymentStatus" method="Get" name="form1">
		<div>
		<div
			style="width: 40%; float: left;   margin: 10px; border-width: 1.75px; border-style: solid; border-color: #C8C8C8;">
			<span style="font-family: 'Roboto', sans-serif; ">
				<label>
					<b>List of all Parameters</b>
				</label>
			</span><br><br>

			<!-- Header -->

			<label>Merchant ID:</label>&nbsp;<br>
			<input type="text" name="merchantId" value="MERCH_4321" required><br><br>

			<!-- Header ends here -->

			<label>Transaction ID Type :</label>&nbsp;<br>
			<input type="text" name="transactionIdType" value="MERCHANT_TXN_ID" required><br><br>

			<label>Transaction ID :</label>&nbsp;<br>
			<input type="text" name="transactionId" required><br><br>

			<label>Signature Method :</label>&nbsp;<br>
			<input type="text" name="signatureMethod" required><br><br>

			<label>Signature Version :</label>&nbsp;<br>
			<input type="text" name="signatureVersion" required><br><br>

			<label>Access Key ID :</label>&nbsp;<br>
			<input type="text" name="accessKeyId" required><br><br>
				
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
		<input type="submit" value="Payment Status" class="button">
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