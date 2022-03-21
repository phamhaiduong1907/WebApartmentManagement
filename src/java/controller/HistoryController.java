/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.HistoryDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.History;

/**
 *
 * @author Hai Duong
 */
public class HistoryController extends BaseAuthenticationController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HistoryDBContext db = new HistoryDBContext();
        ArrayList<History> histories = db.getHistories();
        request.setAttribute("histories", histories);
        request.getRequestDispatcher("history.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        ArrayList<History> histories = null;
        HistoryDBContext db = new HistoryDBContext();
        if (from.length() != 0 && to.length() != 0) {
            Date fromDate = Date.valueOf(from);
            Date toDate = Date.valueOf(to);
            histories = db.getHistoriesInterval(fromDate, toDate);
        } else {
            from = "";
            to = "";
            histories = db.getHistories();
        }
        request.setAttribute("histories", histories);
        request.setAttribute("from", from);
        request.setAttribute("to", to);
        request.getRequestDispatcher("history.jsp").forward(request, response);
    }
}
