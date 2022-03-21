/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.SpendDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Spend;

/**
 *
 * @author Hai Duong
 */
public class SpendController extends BaseAuthenticationController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SpendDBContext dbSpend = new SpendDBContext();
        ArrayList<Spend> spends = dbSpend.getSpends();
        request.setAttribute("spends", spends);
        request.getRequestDispatcher("spend.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        ArrayList<Spend> spends = null;
        SpendDBContext db = new SpendDBContext();
        if((from != null && to != null)||(from.trim().length() != 0 && to.trim().length() != 0 )){
            Date fromDate = Date.valueOf(from);
            Date toDate = Date.valueOf(to);
            spends = db.getSpendsInterval(fromDate, toDate);
        } else {
            spends = db.getSpends();
        }
        request.setAttribute("spends", spends);
        request.setAttribute("to", to);
        request.setAttribute("from", from);
        request.getRequestDispatcher("spend.jsp").forward(request, response);
    }
    
}
