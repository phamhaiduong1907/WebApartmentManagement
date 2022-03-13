/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import controller.BaseAuthenticationController;
import dal.CustomerDBContext;
import dal.RoomDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;
import model.Room;

/**
 *
 * @author Hai Duong
 */
public class DeleteCustomerController extends BaseAuthenticationController {
    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        int rid = Integer.parseInt(request.getParameter("rid"));
        String id = request.getParameter("id");
        CustomerDBContext dbCust = new CustomerDBContext();
        dbCust.deleteCustomer(id);
        response.sendRedirect("../room?rid="+rid);
    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

}
