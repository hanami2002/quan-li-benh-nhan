/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.PaitnetDAO;
import dao.UserDAO;
import entity.Paitnet;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Hanami
 */
public class AddPaitnet extends HttpServlet {

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

        try {
            String action = request.getParameter("btn");
            String name = request.getParameter("pname");
            String dob = request.getParameter("pdob");
            String address = request.getParameter("paddress");
            String phone = request.getParameter("pphone");
            String create = request.getParameter("pcreate");
            PrintWriter out = response.getWriter();
            out.print(action);
            out.println(name + " " + address + " " + dob + " " + phone + " " + create);
            PaitnetDAO pdao = new PaitnetDAO();
            if (action.equals("Add")) {
                pdao.addPaitnet(name, address, dob, phone, create);
                UserDAO udao = new UserDAO();
                List<Paitnet> list = pdao.getListPaitnet();
                udao.addUserPaitnet("paitnet" + list.get(list.size() - 1).getId(), name);
            }
            if (action.equals("Edit")) {
                String pid = request.getParameter("pid");
                pdao.updatePaitnet(name, address, dob, phone, create, Integer.parseInt(pid));
            }
            response.sendRedirect("home");
        } catch (Exception e) {
            response.sendRedirect("fail.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
