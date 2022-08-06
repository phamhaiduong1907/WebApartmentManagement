/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.service;

import controller.BaseAuthenticationController;
import dal.HistoryDBContext;
import dal.IncomeDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jboss.weld.annotated.slim.BaseAnnotated;

/**
 *
 * @author Hai Duong
 */
public class ConfirmServiceController extends BaseAuthenticationController {
    
    private void processRequest (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        int rid = Integer.parseInt(request.getParameter("rid"));
        int amount = Integer.parseInt(request.getParameter("amount"));
        String name = request.getParameter("name");
        int id = Integer.parseInt(request.getParameter("id"));
        IncomeDBContext dbIncome = new IncomeDBContext();
        HistoryDBContext dbHistory = new HistoryDBContext();
        dbHistory.insertHistory(rid, name, amount);
        dbIncome.deleteService(id);
        response.sendRedirect("../income");
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
