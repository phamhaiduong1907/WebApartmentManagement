/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.rent;

import controller.BaseAuthenticationController;
import dal.IncomeDBContext;
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
public class DeleteController extends BaseAuthenticationController {
    
    private void processRequest(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        IncomeDBContext dbIncome = new IncomeDBContext();
        dbIncome.deleteRent(id);
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
