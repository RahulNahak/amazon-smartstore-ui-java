package com.amazon.smartstore.api.client.servlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

@WebServlet(name="initiateChargeRequestSMS", urlPatterns = "/initiateChargeRequestSMS")
public class InitiateChargeRequestSMS extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {

    }

}
