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
public class CreateManyController extends BaseAuthenticationController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String name = request.getParameter("rentName");
        IncomeDBContext dbIncome = new IncomeDBContext();
        RoomDBContext dbRoom = new RoomDBContext();
        for (Room r : dbRoom.getRoomByStatus(true)) {
            int amount = r.getPrice()*3;
            dbIncome.insertRent(r.getRid(), name, amount, null);
        }
        response.sendRedirect("../income");
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
    
}
