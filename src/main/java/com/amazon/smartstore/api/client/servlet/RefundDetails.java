package com.amazon.smartstore.api.client.servlet;

import com.amazon.smartstore.api.client.SmartStoreClient;
import com.amazon.smartstore.api.exceptions.SmartStoreClientException;
import com.amazon.smartstore.api.model.AmazonPayResponse;
import org.json.JSONObject;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URISyntaxException;
import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.Map;

public class RefundDetails extends HttpServlet {

    @Override
    protected  void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

//        AmazonPayResponse amazonPayResponse = null;
//        SmartStoreClient smartStoreClient = new SmartStoreClient(null);

        //header info
        Map<String, String> header = new HashMap<>();
        header.put("merchantId", req.getParameter("merchantId"));

        System.out.println(header);

//        //payload
//        JSONObject payload = addPayload(req);



      /*  try {
            amazonPayResponse = smartStoreClient.getPaymentStatus(payload, header);

        } catch (SmartStoreClientException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        } catch (GeneralSecurityException e) {
            e.printStackTrace();
        }

        String response = amazonPayResponse.getResponse().toString();
        HttpSession session = req.getSession();
        session.setAttribute("jsonRequest", payload.toString());
        session.setAttribute("jsonResponse", response);
        resp.sendRedirect("/amazon-smat-store-ui-java/pages/PaymentStatus.jsp");*/
    }

    /*private JSONObject addPayload(HttpServletRequest req) {
    }*/
}
