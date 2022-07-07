package com.amazon.smartstore.api.client;

import java.io.IOException;
import java.net.URISyntaxException;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;

import com.amazon.smartstore.api.exceptions.SmartStoreClientException;
//import com.amazon.smartstore.api.exceptions.SmartStoreClientException;
import com.amazon.smartstore.api.model.AmazonPayResponse;

//@WebServlet(name = "generateQRCodeServlet", urlPatterns = "/amazon-smat-store-ui-java/generateQRCode")
public class GenerateQRCodeServlet extends HttpServlet {

	
	/*private static final long serialVersionUID = 1L;

	public GenerateQRCodeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}*/
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		AmazonPayResponse amazonPayResponse = null;
        SmartStoreClient smartStoreClient = new SmartStoreClient();
        
      //header info
        Map<String, String> header = new HashMap<>();
        header.put("merchantId", req.getParameter("merchantId"));
        
      //payload
        JSONObject payload = addPayload(req);
        
        try {
            amazonPayResponse = smartStoreClient.initiateChargeRequestQR(payload, header);

        } catch (SmartStoreClientException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        } catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (GeneralSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		
		String response = amazonPayResponse.getResponse().toString();
        HttpSession session = req.getSession();
        session.setAttribute("jsonRequest", payload.toString());
        session.setAttribute("jsonResponse", response);
		
		
		resp.sendRedirect("/amazon-smat-store-ui-java/pages/GenerateQRCode.jsp");
		
		
	}
	
	private JSONObject addPayload(HttpServletRequest req) {


        //storeDetail info
        Map<String, String> storeDetail = new HashMap<>();
        storeDetail.put("storeId", req.getParameter("storeId"));
        storeDetail.put("storeIdType", req.getParameter("storeIdType"));
        storeDetail.put("terminalId", req.getParameter("terminalId"));
        storeDetail.put("storeName", req.getParameter("storeName"));
        storeDetail.put("brand", req.getParameter("brand"));

        //customer detail
        Map<String, String>  customerDetail = new HashMap<>();
        customerDetail.put("phoneNumber", req.getParameter("phoneNumber"));

        //catalogue details
        List<Map<String, String>> catalogueDetails = new ArrayList<>();

        for(int i=0; req.getParameter("unitPrice" + i)!= null; i++) {
            Map<String, String> catalogueDetail = new HashMap<>();
            catalogueDetail.put("skuCode", req.getParameter("skuCode" + i));
            catalogueDetail.put("title", req.getParameter("title" + i));
            catalogueDetail.put("asin", req.getParameter("asin" + i));
            catalogueDetail.put("productNote", req.getParameter("productNote" + i));
            catalogueDetail.put("unitPrice", req.getParameter("unitPrice" + i));
            catalogueDetail.put("quantity", req.getParameter("quantity" + i));
            catalogueDetail.put("brand", req.getParameter("brand" + i));
            catalogueDetail.put("uniqueIdentifierStatus", req.getParameter("uniqueIdentifierStatus" + i));
            catalogueDetail.put("uniqueIdentifierType", req.getParameter("uniqueIdentifierType" + i));
            catalogueDetail.put("uniqueIdentifier", req.getParameter("uniqueIdentifier" + i));
            catalogueDetails.add(catalogueDetail);
        }

        JSONObject payload = new JSONObject();
        payload.put("amount", req.getParameter("amount"));
        payload.put("currencyCode", req.getParameter("currencyCode"));
        payload.put("merchantTransactionId", req.getParameter("merchantTransactionId"));
        payload.put("signatureMethod", req.getParameter("signatureMethod"));
        payload.put("signatureVersion", req.getParameter("signatureVersion"));
        payload.put("accessKeyId", req.getParameter("accessKeyId"));
        payload.put("merchantId", req.getParameter("merchantId"));
        payload.put("customerFriendlyBillPageMessage", req.getParameter("customerFriendlyBillPageMessage"));
        payload.put("transactionTimeOut", req.getParameter("transactionTimeout"));
        payload.put("sandbox", req.getParameter("sandbox"));
        payload.put("isLoyalCustomer", req.getParameter("isLoyalCustomer"));
        payload.put("storeDetail", storeDetail);
        payload.put("customerDetail", customerDetail);
        payload.put("catalogueDetails", catalogueDetails);

        return payload;
    }
	

}
