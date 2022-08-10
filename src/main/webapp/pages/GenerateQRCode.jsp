<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Generate QR Code</title>
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
	<div style="text-align: center;">
		<img src="../images/Amazon_Pay-Logo.wine.png"
			style="width: 250px; height: 150px; margin-top: -3%;"><br>
		<br>
	</div>
	<div style="margin-top: -5%;">
		<span style="font-family: 'Roboto', sans-serif;"><b>Generate QR Code</b></span><br>
	</div>
	<input type="text" readonly name="path"
		value="API: /v1/smart-store/payment/token/QR" style="width: 250px;">
	<br>
	<br>

	<form action="/amazon-smat-store-ui-java/generateQRCode" method="GET" name="form1" id="generateQRCode">
		<div>
		<div
			style="width: 40%; float: left;   margin: 10px; border-width: 1.75px; border-style: solid; border-color: #C8C8C8;">
			<span style="font-family: 'Roboto', sans-serif; "><b>List of all Parameters</b></span><br><br>
				<label>Merchant ID:</label>&nbsp;
				<input type="text" name="merchantId" value="10000" required><br><br>
				
				<label>Amount:</label>&nbsp;
				<input type="number" name="amount" value="10000" required><br><br>
				
				<label>Currency Code:</label>&nbsp;
				<input type="text" name="currencyCode" value="INR" required><br><br>
				
				<label>Merchant Transaction ID:</label>&nbsp;
				<input type="text" name="merchantTransactionId" value="SNS_R_1146787" required><br><br>
				
				<label>Signature Method:</label>&nbsp;
				<input type="text" name="signatureMethod" value="HmacSHA384" required><br><br>
				
				<label>Signature Version:</label>&nbsp;
				<input type="text" name="signatureVersion" value="4" required><br><br>
				
				<label>AccessKey ID:</label>&nbsp;
				<input type="text" name="accessKeyId" value="412ASDF" required><br><br>
				
				<label>customerFriendlyBillPageMessage:</label>&nbsp;
				<input type="number" name="customerFriendlyBillPageMessage" value="75742" required><br><br>
				
				<label>Transaction TimeOut:</label>&nbsp;
				<input type="text" name="transactionTimeOut" value="180" required><br><br>
				
				<label>Sandbox:</label>&nbsp;
				<select name="sandbox" id="">
					<option value="true"> True </option>
					<option value="false"> False </option>
				</select><br><br>
				
				<label>isLoyalCustomer:</label>&nbsp;
				<select name="isLoyalCustomer" id="">
					<option value="true"> True </option>
					<option value="false"> False </option>
				</select><br><br>
				
				<span style="font-family: 'Roboto', sans-serif; border: #C8C8C8; ">
					<label>
						Store Details
					</label>
				</span><br><br>
				
				<label>Store ID:</label>&nbsp;
				<input type="text" name="storeId" value="Store_123" required><br><br>
				
				<label>Store ID Type:</label>&nbsp;
				<input type="text" name="storeIdType" value="MERCHANT_STORE_ID" required><br><br>
				
				<label>Terminal ID:</label>&nbsp;
				<input type="text" name="terminalId" value="12df" required><br><br>
				
				<label>Store Name:</label>&nbsp;
				<input type="text" name="storeName" value="ForumMart" required><br><br>
				
				<label>Brand:</label>&nbsp;
				<input type="text" name="brand" value="PUMA" required><br><br>
				
				<span style="font-family: 'Roboto', sans-serif; border: #C8C8C8; ">
					<label>
						Catalogue details
					<label>
				</span><br><br>
				<div id="catalogue0">
					<label>skuCode:</label>&nbsp;<br>
					<input type="text" name="skuCode0"><br><br>

					<label>Title:</label>&nbsp;<br>
					<input type="text" name="title0"><br><br>

					<label>ASIN:</label>&nbsp;<br>
					<input type="text" name="asin0"><br><br>

					<label>Product Note:</label>&nbsp;<br>
					<input type="text" name="productNote0"><br><br>

					<label>Unit Price:</label>&nbsp;<br>
					<input type="number" name="unitPrice0" required><br><br>

					<label>Quantity:</label>&nbsp;<br>
					<input type="text" name="quantity0" required><br><br>

					<label>Brand:</label>&nbsp;<br>
					<input type="text" name="brand0"><br><br>

					<label>Unique Identifier Status:</label>&nbsp;<br>
					<input type="text" name="uniqueIdentifierStatus0"><br><br>

					<label>Unique Identifier Type:</label>&nbsp;<br>
					<input type="text" name="uniqueIdentifierType0"><br><br>

					<label>Unique Identifier:</label>&nbsp;<br>
					<input type="text" name="uniqueIdentifier0"><br><br>
				
				<div id="catalogues">
		
				</div>
						
				</div>		
				<button type="button" onclick="add_more_catalogue()">Add Catalogue (+)</button>&nbsp;&nbsp;&nbsp;
				<button type="button" onclick="delete_catalogue()">Remove Catalogue (-)</button>
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
		<input type="submit" value="Get QR Code" class="button">
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

	var counter = 0;
	function add_more_catalogue() {
		counter+=1;
		html = `<hr id="hr${counter}">
				<div id="catalogue${counter}">
					<label>skuCode:</label>&nbsp;<br>
					<input type="text" name="skuCode${counter}"><br><br>
					<label>Title:</label>&nbsp;<br>
					<input type="text" name="title${counter}"><br><br>
					<label>ASIN:</label>&nbsp;<br>
					<input type="text" name="asin${counter}"><br><br>
					<label>Product Note:</label>&nbsp;<br>
					<input type="text" name="productNote${counter}"><br><br>
					<label>Unit Price:</label>&nbsp;<br>
					<input type="number" name="unitPrice${counter}" required><br><br>
					<label>Quantity:</label>&nbsp;<br>
					<input type="text" name="quantity${counter}" required><br><br>
					<label>Brand:</label>&nbsp;<br>
					<input type="text" name="brand${counter}"><br><br>
					<label>Unique Identifier Status:</label>&nbsp;<br>
					<input type="text" name="uniqueIdentifierStatus${counter}"><br><br>
					<label>Unique Identifier Type:</label>&nbsp;<br>
					<input type="text" name="uniqueIdentifierType${counter}"><br><br>
					<label>Unique Identifier:</label>&nbsp;<br>
					<input type="text" name="uniqueIdentifier${counter}"><br><br>	
				</div>`;
		const form = document.getElementById("catalogues");
		form.innerHTML+=html;
	}
	
	function delete_catalogue() {
		if(counter > 0) {
			const element = document.getElementById(`catalogue${counter}`);
			element.remove();
			const hrId = document.getElementById(`hr${counter}`);
			hrId.remove();
			counter--;
		}
	}

	console.log(s);
</script>
</html>