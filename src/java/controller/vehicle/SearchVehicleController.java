/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.vehicle;

import controller.BaseAuthenticationController;
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
public class SearchVehicleController extends BaseAuthenticationController {

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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        VehicleDBContext db = new VehicleDBContext();
        String name = request.getParameter("name");
        ArrayList<Vehicle> vehiclesByOwner = db.getVehiclesByOwner(name);
        PrintWriter out = response.getWriter();
        if (vehiclesByOwner.isEmpty()) {
            out.println("<p style=\"text-align: center;\">Không tìm thấy phương tiện nào!</p>");
        } else {
            for (int i = 0; i < vehiclesByOwner.size(); i++) {
                out.println(" <tr>\n"
                        + "                           <td>" + (i + 1) + "</td>\n"
                        + "                           <td>" + vehiclesByOwner.get(i).getCustomer().getName() + "</td>\n"
                        + "                           <td>" + vehiclesByOwner.get(i).getCustomer().getId() + "</td>\n"
                        + "                           <td>" + vehiclesByOwner.get(i).getVtype() + "</td>\n"
                        + "                           <td>" + ((vehiclesByOwner.get(i).getVnumber() != null) ? vehiclesByOwner.get(i).getVnumber()
                        : "-") + "</td>\n"
                        + "                           <td>\n"
                        + "                               <a href=\"#\" class=\"update\">Chỉnh sửa</a>\n"
                        + "                               <a href=\"#\" class=\"delete\">Xóa</a>\n"
                        + "                           </td>\n"
                        + "                          </tr> ");
            }
        }
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
