/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.service;

import controller.BaseAuthenticationController;
import dal.IncomeDBContext;
import dal.RoomDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Rent;
import model.Room;
import model.Service;

/**
 *
 * @author Hai Duong
 */
public class AddServiceController extends BaseAuthenticationController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String rids[] = request.getParameterValues("rid");
        String serviceName = request.getParameter("serviceName");
        int servicePrice = Integer.parseInt(request.getParameter("servicePrice"));
        int unitElectricity = Integer.parseInt(request.getParameter("unitElectricity"));
        String[] consumedElecs = request.getParameterValues("consumedElec");
        IncomeDBContext db = new IncomeDBContext();
        for (int i = 0; i < rids.length; i++) {
            int rid = Integer.parseInt(rids[i]);
            int elecno = Integer.parseInt(consumedElecs[i]);
            db.addService(rid, serviceName, servicePrice, elecno, unitElectricity, null);
        }
        response.sendRedirect("../income");
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        int rid = Integer.parseInt(request.getParameter("rid"));
        String serviceName = request.getParameter("serviceName");
        int servicePrice = Integer.parseInt(request.getParameter("servicePrice"));
        int unitElectricity = Integer.parseInt(request.getParameter("unitElectricity"));
        int elecno = Integer.parseInt(request.getParameter("elecno"));
        IncomeDBContext db = new IncomeDBContext();
        db.addService(rid, serviceName, servicePrice, elecno, unitElectricity, null);
        response.sendRedirect("../income");
    }

}
