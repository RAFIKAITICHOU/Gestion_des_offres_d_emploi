package controllers;

import entities.Candidat;
import services.CandidatService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CandidatController", urlPatterns = {"/CandidatController"})
public class CandidatController extends HttpServlet {

    private CandidatService service;

    @Override
    public void init() throws ServletException {
        service = new CandidatService();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String op = request.getParameter("op");

        if (op == null) {
            String id = request.getParameter("id");

            String nom = request.getParameter("nom");
            String email = request.getParameter("email");
            String motDePasse = request.getParameter("motDePasse");
            String telephone = request.getParameter("telephone");

            if (id == null || id.isEmpty()) {
                // CREATE
                Candidat candidat = new Candidat(nom, email, motDePasse, telephone);
                service.create(candidat);
            } else {
                // UPDATE
                Candidat candidat = new Candidat(nom, email, motDePasse, telephone);
                candidat.setId(Integer.parseInt(id));
                service.update(candidat);
            }

            response.sendRedirect("candidats/page.jsp");

        } else if (op.equals("delete")) {
            String id = request.getParameter("id");
            service.delete(service.findById(Integer.parseInt(id)));
            response.sendRedirect("candidats/page.jsp");

        } else if (op.equals("update")) {
            String id = request.getParameter("id");
            Candidat obj = service.findById(Integer.parseInt(id));
            response.sendRedirect("candidats/page.jsp?id=" + obj.getId()
                    + "&nom=" + obj.getNom()
                    + "&email=" + obj.getEmail()
                    + "&motDePasse=" + obj.getMotDePasse()
                    + "&telephone=" + obj.getTelephone());
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
        return "CandidatController Servlet";
    }
}
