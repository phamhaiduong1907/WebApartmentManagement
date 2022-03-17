/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.VehicleDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Vehicle;

/**
 *
 * @author Hai Duong
 */
public class ServiceController extends BaseAuthenticationController {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        VehicleDBContext db = new VehicleDBContext();
        ArrayList<Vehicle> vehicles = db.getVehicles();
//        response.getWriter().println(vehicles.size());
        int bike, motorbike, electricbike;
        bike = motorbike = electricbike = 0;
        for (Vehicle vehicle : vehicles) {
            if(vehicle.getVtype().trim().equalsIgnoreCase("xe máy"))
                motorbike++;
            if(vehicle.getVtype().trim().equalsIgnoreCase("xe đạp"))
                bike++;
            if(vehicle.getVtype().trim().equalsIgnoreCase("xe điện"))
                electricbike++;
        }
//        response.getWriter().println("Xe đạp: "+bike);
//        response.getWriter().println("Xe máy: "+motorbike);
//        response.getWriter().println("Xe điện: "+electricbike);
        request.setAttribute("bike", bike);
        request.setAttribute("motorbike", motorbike);
        request.setAttribute("electricbike", electricbike);
        request.setAttribute("vehicles", vehicles);
        request.getRequestDispatcher("service.jsp").forward(request, response);
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
