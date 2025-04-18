package controllers;

import entities.User;
import services.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserController", urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {

    private UserService service;

    @Override
    public void init() throws ServletException {
        service = new UserService();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String op = request.getParameter("op");

        if (op == null) {
            String id = request.getParameter("id");

            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String email = request.getParameter("email");
            String motDePasse = request.getParameter("motDePasse");

            if (id == null || id.isEmpty()) {
                List<User> existing = service.findByEmail(email);
                if (!existing.isEmpty()) {
                    response.sendRedirect("users/register.jsp?error=1");
                    return;
                }

                User user = new User(nom, email, motDePasse);
                service.create(user);
                response.sendRedirect("users/register.jsp?success=1");
            } else {
                User user = new User(nom, email, motDePasse);
                user.setId(Integer.parseInt(id));
                service.update(user);
                response.sendRedirect("users/page.jsp");
            }

        } else if (op.equals("delete")) {
            String id = request.getParameter("id");
            service.delete(service.findById(Integer.parseInt(id)));
            response.sendRedirect("users/page.jsp");

        } else if (op.equals("update")) {
            String id = request.getParameter("id");
            User obj = service.findById(Integer.parseInt(id));
            response.sendRedirect("users/page.jsp?id=" + obj.getId()
                    + "&nom=" + obj.getNom()
                    + "&email=" + obj.getEmail()
                    + "&motDePasse=" + obj.getMotDePasse());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "UserController Servlet";
    }
}

