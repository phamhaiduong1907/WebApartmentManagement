/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.spend;

import controller.BaseAuthenticationController;
import dal.SpendDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Hai Duong
 */
public class CreateSpendController extends BaseAuthenticationController {
    
    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String spendName = request.getParameter("spendName");
        int spendAmount = Integer.parseInt(request.getParameter("spendAmount").trim());
        String spendNote = request.getParameter("spendNote");
        SpendDBContext db = new SpendDBContext();
        db.insertSpend(spendName, spendAmount, spendNote);
        response.sendRedirect("../spend");
    }
    
    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
    
}
