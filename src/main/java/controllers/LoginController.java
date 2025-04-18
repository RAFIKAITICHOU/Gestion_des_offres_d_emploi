/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers;

/**
 *
 * @author ichou
 */
import entities.User;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import services.UserService;

@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    private UserService us;

    @Override
    public void init() throws ServletException {
        us = new UserService(); 
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("mdp");

        List<User> utilisateurs = us.findByEmail(email);

        if (!utilisateurs.isEmpty()) {
            User user = utilisateurs.get(0);

            if (user.getMotDePasse().equals(password)) {
                HttpSession session = request.getSession();
                session.setAttribute("currentUser", user);

                response.sendRedirect("users/users.jsp");
                return;
            }
        }

        // Échec de connexion : message d’erreur
        request.setAttribute("errorMessage", "Email ou mot de passe incorrect !");
        request.getRequestDispatcher("users/login.jsp").forward(request, response); // À AJOUTER
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response); // Redirige les GET vers login.jsp
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Login Servlet Controller";
    }
}

