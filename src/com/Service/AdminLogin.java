package com.Service;

import com.Controller.ExceptionInvalidPassword;
import com.Data.AdminLoginDAO;
import com.Entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Zexter on 07/02/2015.
 */
@WebServlet(name = "AdminLogin",urlPatterns = "/Dashboard/AdminLogin")
public class AdminLogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("userid")!=null){
            User user = new User();
            user.setUsername(request.getParameter("userid").toString());
            user.setPassword(request.getParameter("password").toString());

                int perm = new AdminLoginDAO().authLogin(user);
                if (perm>0){
                    System.out.println("User Login Successful");
                    HttpSession session = request.getSession();
                    session.setAttribute("username",user.getUsername());
                    session.setAttribute("permission",perm);
                    response.sendRedirect("/index.jsp");

                }else{
                    System.out.println("User Login Failed");
                    response.sendRedirect("/Login.jsp");
                }



        }else{
            response.sendRedirect("/Login.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
