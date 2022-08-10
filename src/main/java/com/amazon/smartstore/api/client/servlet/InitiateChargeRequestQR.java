package com.amazon.smartstore.api.client.servlet;

import java.io.IOException;
import java.net.URISyntaxException;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.amazon.smartstore.api.client.SmartStoreClient;
import com.amazon.smartstore.api.config.Configuration;
import com.amazon.smartstore.api.exceptions.SmartStoreClientException;
import com.amazon.smartstore.api.model.AmazonPayResponse;

public class InitiateChargeRequestQR extends HttpServlet{
	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        AmazonPayResponse amazonPayResponse = null;
        Configuration config = new Configuration("Secret Key");
        SmartStoreClient smartStoreClient = new SmartStoreClient(config);

        //header info
        Map<String, String> header = new HashMap<>();
        header.put("merchantId", req.getParameter("merchantId"));

        //payload
        JSONObject payload = addPayload(req);

        try {
            amazonPayResponse = smartStoreClient.initiateChargeRequestQR(payload, header);
            	System.out.println("amazonPayResponse : "+amazonPayResponse);
        } catch (SmartStoreClientException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
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

    /**
     * addPayload() : method used to add the required fields to payload JSON Object
     * signature & timestamp filed would be inserted inside SDK
     */
    private JSONObject addPayload(HttpServletRequest req) {


        //storeDetail info
        Map<String, String> storeDetail = new HashMap<>();
        storeDetail.put("storeId", req.getParameter("storeId"));
        storeDetail.put("storeIdType", req.getParameter("storeIdType"));
        storeDetail.put("terminalId", req.getParameter("terminalId"));
        storeDetail.put("storeName", req.getParameter("storeName"));
        storeDetail.put("brand", req.getParameter("brand"));

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
        payload.put("catalogueDetails", catalogueDetails);

        return payload;
    }

}
