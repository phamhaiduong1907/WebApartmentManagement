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
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Contract;
import model.Customer;
import model.Room;

/**
 *
 * @author Hai Duong
 */
public class UpdateCustomerController extends BaseAuthenticationController {
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
        String id = request.getParameter("id");
        RoomDBContext dbRoom = new RoomDBContext();
        ArrayList<Room> rooms = dbRoom.getRooms();
        ArrayList<Room> roomsWithContract = new ArrayList<>();
        for (Room room : rooms) {
            Contract contract =  room.getContract();
            if(contract.getStartdate() != null && contract.getEnddate() != null && 
                    contract.getCustomers().size() < room.getType()){
                roomsWithContract.add(room);
            }
        }
        Room roomByID = dbRoom.getRoomByID(rid);
        Customer customer = null;
        for (Customer c : roomByID.getContract().getCustomers()) {
            if(c.getId().equalsIgnoreCase(id)){
                customer = c;
            }
        }
        request.setAttribute("customer", customer);
        request.setAttribute("roomByID", roomByID);
        request.setAttribute("roomsWithContract", roomsWithContract);
        request.getRequestDispatcher("../update.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String name = request.getParameter("name");
        Date dob = Date.valueOf(request.getParameter("dob"));
        boolean gender = request.getParameter("gender").equals("male");
        String id = request.getParameter("id");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        int rid = Integer.parseInt(request.getParameter("rid"));
        String default_id = request.getParameter("default_id");
        CustomerDBContext db = new CustomerDBContext();
        db.updateCustomer(id, name, dob, gender, phone, address, rid, default_id);
        response.sendRedirect("../room?rid="+rid);
    }
}
