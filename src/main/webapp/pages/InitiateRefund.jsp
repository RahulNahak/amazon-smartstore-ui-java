<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Initiate Refund</title>
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
		<span style="font-family: 'Roboto', sans-serif;"><b>Send Refund Link</b></span><br>
	</div>
	<input type="text" readonly name="path"
		value="API: /payment/refund/v1" style="width: 250px;">
	<br>
	<br>

	<form action="/amazon-smat-store-ui-java/initiateRefund" method="GET" name="form1">
		<div>
		<div
			style="width: 40%; float: left;   margin: 10px; border-width: 1.75px; border-style: solid; border-color: #C8C8C8;">
			<span style="font-family: 'Roboto', sans-serif; "><b>List of all Parameters</b></span><br><br>
			
			<label>Merchant ID:</label>&nbsp;
				<input type="text" name="merchantId" value="10000" required><br><br>
				
				<label>Amazon Transaction Id:</label>&nbsp;
				<input type="text" name="amazonTransactionId" value="TESTORDERID123" required><br><br>
				
				<label>Amazon Transaction Id Type:</label>&nbsp;
				<input type="text" name="amazonTransactionIdType" value="AMAZON_ORDER_ID" required><br><br>
				
				<label>Amount:</label>&nbsp;
				<input type="number" name="amount" value="100" required><br><br>
				
				<label>Currency Code:</label>&nbsp;
				<input type="text" name="currencyCode" value="INR" required><br><br>
				
				<label>Refund Reference ID:</label>&nbsp;
				<input type="text" name="refundReferenceId" value="R123" required><br><br>
				
				<label>Seller Note To Customer:</label>&nbsp;
				<input type="text" name="sellerNoteToCustomer" value="" required><br><br>
				
				<label>Soft Descriptor:</label>&nbsp;
				<input type="text" name="softDescriptor" value="" required><br><br>				
				
				<label>Signature Method:</label>&nbsp;
				<input type="text" name="signatureMethod" value="HmacSHA384" required><br><br>
				
				<label>Signature Version:</label>&nbsp;
				<input type="text" name="signatureVersion" value="4" required><br><br>
				
				<label>AccessKey ID:</label>&nbsp;
				<input type="text" name="accessKeyId" value="412ASDF" required><br><br>
				
				<label>Sand Box:</label>&nbsp;
				<input type="text" name="sandBox" value="false" required><br><br>
				
				
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