package controllers;

import entities.Entreprise;
import services.EntrepriseService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "EntrepriseController", urlPatterns = {"/EntrepriseController"})
public class EntrepriseController extends HttpServlet {

    private EntrepriseService service;

    @Override
    public void init() throws ServletException {
        service = new EntrepriseService();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String op = request.getParameter("op");

        if (op == null) {
            String id = request.getParameter("id");
            String nom = request.getParameter("nom");
            String secteur = request.getParameter("secteur");

            if (id == null || id.isEmpty()) {
                // CREATE
                Entreprise entreprise = new Entreprise(nom, secteur);
                service.create(entreprise);
            } else {
                // UPDATE
                Entreprise entreprise = new Entreprise(nom, secteur);
                entreprise.setId(Integer.parseInt(id));
                service.update(entreprise);
            }

            response.sendRedirect("entreprises/page.jsp");

        } else if (op.equals("delete")) {
            String id = request.getParameter("id");
            service.delete(service.findById(Integer.parseInt(id)));
            response.sendRedirect("entreprises/page.jsp");

        } else if (op.equals("update")) {
            String id = request.getParameter("id");
            Entreprise obj = service.findById(Integer.parseInt(id));
            response.sendRedirect("entreprises/page.jsp?id=" + obj.getId()
                    + "&nom=" + obj.getNom()
                    + "&secteur=" + obj.getSecteur());
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
        return "EntrepriseController Servlet";
    }
}
