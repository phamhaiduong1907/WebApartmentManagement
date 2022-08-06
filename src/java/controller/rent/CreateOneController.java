/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.rent;

import controller.BaseAuthenticationController;
import dal.IncomeDBContext;
import dal.RoomDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Room;

/**
 *
 * @author Hai Duong
 */
public class CreateOneController extends BaseAuthenticationController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String name = request.getParameter("rentName");
        int rid = Integer.parseInt(request.getParameter("room"));
        RoomDBContext dbRoom = new RoomDBContext();
        Room roomByID = dbRoom.getRoomByID(rid);
        int amount = roomByID.getPrice()*3;
        IncomeDBContext dbIncome = new IncomeDBContext();
        dbIncome.insertRent(rid, name, amount, null);
        response.sendRedirect("../income");
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
