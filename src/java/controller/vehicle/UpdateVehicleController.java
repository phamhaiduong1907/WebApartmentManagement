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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Vehicle;

/**
 *
 * @author Hai Duong
 */
public class UpdateVehicleController extends BaseAuthenticationController {
    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int vid = Integer.parseInt(request.getParameter("vid"));
        VehicleDBContext db = new VehicleDBContext();
        Vehicle vehicleByVid = db.getVehicleByVid(vid);
        PrintWriter out = response.getWriter();
        out.println(" <form action=\"vehicle/update\" method=\"POST\">\n" +
"                    <div class=\"add_heading\"></div>\n" +
"                    <div class=\"add_input\">\n" +
"                        <table id=\"addTable\">\n" +
"                            <tr>\n" +
"                                <td>\n" +
"                                    <label for=\"idUpdate\">Chứng minh thư(CCCD): </label>\n" +
"                                </td>\n" +
"                                <td>\n" +
"                                    <input type=\"text\" name=\"id\" id=\"idUpdate\" placeholder=\"Chứng minh thư(CCCD)\" autocomplete=\"off\" "
                + "required value=\""+vehicleByVid.getCustomer().getId()+"\">\n" +
"                                </td>\n" +
"                            </tr>\n" +
"                            <tr>\n" +
"                                <td><label for=\"ticketNoUpdate\">Số vé</label></td>\n" +
"                                <td>\n" +
"                                <input type=\"hidden\" name=\"defaultTicket\" value=\""+vehicleByVid.getVid()+"\"/>"
                        + "<input type=\"text\" name=\"ticket\" id=\"ticketNoUpdate\" placeholder=\"Số vé\" autocomplete=\"off\" "
                        + "required value=\""+vehicleByVid.getVid()+"\">\n" +
"                                </td>\n" +
"                            </tr>\n" +
"                            <tr>\n" +
"                                <td><label for=\"vtype\">Loại xe</label></td>\n" +
"                                <td>\n" +
"                                    <select name=\"vtype\" id=\"vtypeUpdate\">\n" +
"                                        <option value=\"Xe đạp\" "+((vehicleByVid.getVtype().equalsIgnoreCase("Xe đạp"))?"selected":"")+">Xe đạp</option>\n" +
"                                        <option value=\"Xe máy\" "+((vehicleByVid.getVtype().equalsIgnoreCase("Xe máy"))?"selected":"")+">Xe máy</option>\n" +
"                                        <option value=\"Xe điện\" "+((vehicleByVid.getVtype().equalsIgnoreCase("Xe điện"))?"selected":"")+">Xe điện</option>\n" +
"                                    </select>\n" +
"                                </td>\n" +
"                            </tr>\n" +
"                            <tr>\n" +
"                                <td><label for=\"vnumberUpdate\">Biến số(Không bắt buộc):</label></td>\n" +
"                                <td><input type=\"text\" name=\"vnumber\" id=\"vnumberUpdate\" placeholder=\"Biển số\" "
                                + "autocomplete=\"off\" value=\""
                +((vehicleByVid.getVnumber() != null)?vehicleByVid.getVnumber():"") +"\"></td>\n" +
"                            </tr>\n" +
"                        </table>\n" +
"                        <div class=\"add_button\">\n" +
"                        <a href=\"service\">Trở về</a>\n" +
"                        <button type=\"submit\" onclick=\"return checkUpdate()\">Xác nhận</button>\n" +
"                    </div>\n" +
"                    </div>\n" +
"                </form> ");
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        int default_vid = Integer.parseInt(request.getParameter("defaultTicket"));
        int vid = Integer.parseInt(request.getParameter("ticket"));
        String vtype = request.getParameter("vtype");
        String vnumber = request.getParameter("vnumber");
        VehicleDBContext db = new VehicleDBContext();
        db.updateVehicle(vid, id, vtype, vnumber, default_vid);
        response.sendRedirect("../service");
    }

}
