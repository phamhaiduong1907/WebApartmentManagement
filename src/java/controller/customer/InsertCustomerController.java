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
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Room;

/**
 *
 * @author Hai Duong
 */
public class InsertCustomerController extends BaseAuthenticationController {

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
        int rid = Integer.parseInt(request.getParameter("rid"));
        RoomDBContext db = new RoomDBContext();
        Room roomByID = db.getRoomByID(rid);
        request.setAttribute("roomByID", roomByID);
        request.getRequestDispatcher("../create.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String name = request.getParameter("name");
        Date dob = Date.valueOf(request.getParameter("dob"));
        boolean gender = request.getParameter("gender").equals("male");
        String id = request.getParameter("id");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        int rid = Integer.parseInt(request.getParameter("rid"));
        response.getWriter().println("Name:" + name);
        response.getWriter().println("DOB: " + dob.toString());
        response.getWriter().println(request.getParameter("gender"));
        response.getWriter().println("id" + id);
        response.getWriter().println("phone" + phone);
        response.getWriter().println("address" + address);
        CustomerDBContext db = new CustomerDBContext();
        db.insertCustomer(id, name, dob, gender, phone, address, rid);
        response.sendRedirect("../room?rid="+rid);
    }

}
