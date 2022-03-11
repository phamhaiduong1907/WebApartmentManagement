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
public class DetailController extends BaseAuthenticationController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RoomDBContext dbRoom = new RoomDBContext();
        ArrayList<Room> rooms = dbRoom.getRooms();
        request.setAttribute("rooms", rooms);
        request.getRequestDispatcher("detail.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RoomDBContext dbRoom = new RoomDBContext();
        ArrayList<Room> rooms = dbRoom.getRooms();
        String raw_rid = request.getParameter("rid");
        if(raw_rid == null || raw_rid.trim().length() == 0){
            raw_rid = "-1";
        }
        int rid = Integer.parseInt(raw_rid);
        String status = request.getParameter("status");
        if(status == null || status.trim().length() == 0){
            status = "all";
        }
        if (rid != -1) {
            Room roomByID = dbRoom.getRoomByID(rid);
            request.setAttribute("roomByID", roomByID);
        }
        if (!status.equals("all")) {
            boolean status_select = status.equalsIgnoreCase("true");
            ArrayList<Room> roomByStatus = dbRoom.getRoomByStatus(status_select);
            request.setAttribute("status", status);
            request.setAttribute("roomByStatus", roomByStatus);
        }
        request.setAttribute("rooms", rooms);
        request.getRequestDispatcher("detail.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
