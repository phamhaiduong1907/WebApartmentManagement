/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.RoomDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Room;

/**
 *
 * @author Hai Duong
 */
public class IndexController extends BaseAuthenticationController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RoomDBContext dbRoom = new RoomDBContext();
        ArrayList<Room> rooms = dbRoom.getRooms();
        request.setAttribute("rooms", rooms);
        int roomEmpty = 0;
        int roomInRent = 0;
        int customerTotal = 0;
        for (Room room : rooms) {
            customerTotal += room.getCustomers().size();
            if (room.getCustomers().size() > 0) {
                roomInRent++;
            } else {
                roomEmpty++;
            }
        }
        request.setAttribute("roomEmpty", roomEmpty);
        request.setAttribute("roomInRent", roomInRent);
        request.setAttribute("customerTotal", customerTotal);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
