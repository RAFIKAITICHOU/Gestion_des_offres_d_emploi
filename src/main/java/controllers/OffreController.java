package controllers;

import entities.Offre;
import entities.Entreprise;
import services.OffreService;
import services.EntrepriseService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "OffreController", urlPatterns = {"/OffreController"})
public class OffreController extends HttpServlet {

    private OffreService service;
    private EntrepriseService entrepriseService;

    @Override
    public void init() throws ServletException {
        service = new OffreService();
        entrepriseService = new EntrepriseService();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String op = request.getParameter("op");

        if (op == null) {
            String id = request.getParameter("id");

            String titre = request.getParameter("titre");
            String description = request.getParameter("description");
            String typeContrat = request.getParameter("typeContrat");
            double salaire = Double.parseDouble(request.getParameter("salaire"));
            int entrepriseId = Integer.parseInt(request.getParameter("entreprise_id"));

            Entreprise entreprise = entrepriseService.findById(entrepriseId);

            if (id == null || id.isEmpty()) {
                // CREATE
                Offre offre = new Offre(titre, description, salaire, typeContrat, entreprise);
                service.create(offre);
            } else {
                // UPDATE
                Offre offre = new Offre(titre, description, salaire, typeContrat, entreprise);
                offre.setId(Integer.parseInt(id));
                service.update(offre);
            }

            response.sendRedirect("offres/page.jsp");

        } else if (op.equals("delete")) {
            String id = request.getParameter("id");
            service.delete(service.findById(Integer.parseInt(id)));
            response.sendRedirect("offres/page.jsp");

        } else if (op.equals("update")) {
            String id = request.getParameter("id");
            Offre obj = service.findById(Integer.parseInt(id));
            response.sendRedirect("offres/page.jsp?id=" + obj.getId()
                    + "&titre=" + obj.getTitre()
                    + "&description=" + obj.getDescription()
                    + "&salaire=" + obj.getSalaire()
                    + "&typeContrat=" + obj.getTypeContrat()
                    + "&entreprise_id=" + obj.getEntreprise().getId());
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
        return "OffreController Servlet";
    }
}
