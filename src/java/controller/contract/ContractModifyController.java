/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.contract;

import controller.BaseAuthenticationController;
import dal.ContractDBContext;
import dal.RoomDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Hai Duong
 */
public class ContractModifyController extends BaseAuthenticationController {
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
        //create
        int rid = Integer.parseInt(request.getParameter("rid"));
        ContractDBContext db = new ContractDBContext();
        Date startdate = Date.valueOf(request.getParameter("startdate"));
        Date enddate = Date.valueOf(request.getParameter("enddate"));
        db.insertContract(rid, startdate, enddate);
        response.sendRedirect("../room?rid="+rid);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //update
        int rid = Integer.parseInt(request.getParameter("rid"));
        ContractDBContext db = new ContractDBContext();
        Date startdate = Date.valueOf(request.getParameter("startdate"));
        Date enddate = Date.valueOf(request.getParameter("enddate"));
        db.updateContract(rid, startdate, enddate);
        response.sendRedirect("../room?rid="+rid);
    }

}
