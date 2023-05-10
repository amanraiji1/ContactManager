/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.dao.ContactDao;
import com.entities.Contact;
import com.entities.Message;
import com.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hp
 */
public class UpdateServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String cName = request.getParameter("contact-name");
            String cPhone = request.getParameter("contact-phone");
            String cEmail = request.getParameter("contact-email");
            if("".equals(cEmail))
                cEmail = "(Empty)";
            int userId = Integer.parseInt(request.getParameter("contact-userId"));
            String oldPhone = request.getParameter("contact-userOldPhone");

            Contact c = new Contact(cName, cPhone, cEmail, userId);
            ContactDao dao = new ContactDao(ConnectionProvider.getConnection());

            if (dao.updateContactByPhoneAndName(c, userId, oldPhone)) {
                Message m = new Message("Updated Successfully!", "success", "alert-success");
                HttpSession s = request.getSession();
                s.setAttribute("msg", m);
                response.sendRedirect("profile.jsp");
            }
            else{
                Message m = new Message("Phone already saved with other contact!", "error", "alert-danger");
                HttpSession s = request.getSession();
                s.setAttribute("msg", m);
                response.sendRedirect("profile.jsp");
            }

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
