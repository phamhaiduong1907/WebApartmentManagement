/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

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
public class IncomeController extends BaseAuthenticationController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IncomeDBContext dbIncome = new IncomeDBContext();
        ArrayList<Rent> rents = dbIncome.getRents();
        RoomDBContext dbRoom = new RoomDBContext();
        ArrayList<Room> roomByStatus = dbRoom.getRoomByStatus(true);
        ArrayList<Service> services = dbIncome.getServices();
        request.setAttribute("services", services);
        request.setAttribute("rooms", roomByStatus);
        request.setAttribute("rents", rents);
        request.getRequestDispatcher("income.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    
}
