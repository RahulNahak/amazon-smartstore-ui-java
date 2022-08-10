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

public class InitiateRefundRequest extends HttpServlet{
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
            amazonPayResponse = smartStoreClient.initiateRefundRequest(payload, header);
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


        JSONObject payload = new JSONObject();
        payload.put("amount", req.getParameter("amount"));
        payload.put("currencyCode", req.getParameter("currencyCode"));
        payload.put("amazonTransactionId", req.getParameter("amazonTransactionId"));
        payload.put("amazonTransactionIdType", req.getParameter("amazonTransactionIdType"));
        payload.put("sellerNoteToCustomer", req.getParameter("sellerNoteToCustomer"));
        payload.put("softDescriptor", req.getParameter("softDescriptor"));
        payload.put("signatureMethod", req.getParameter("signatureMethod"));
        payload.put("signatureVersion", req.getParameter("signatureVersion"));
        payload.put("accessKeyId", req.getParameter("accessKeyId"));
        payload.put("merchantId", req.getParameter("merchantId"));
        payload.put("sandbox", req.getParameter("sandbox"));
        payload.put("refundReferenceId", req.getParameter("refundReferenceId"));
        

        return payload;
    }

}
