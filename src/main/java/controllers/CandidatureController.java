package controllers;

import entities.Candidature;
import entities.CandidaturePK;
import entities.Candidat;
import entities.Offre;
import services.CandidatureService;
import services.CandidatService;
import services.OffreService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "CandidatureController", urlPatterns = {"/CandidatureController"})
public class CandidatureController extends HttpServlet {

    private CandidatureService service;
    private CandidatService candidatService;
    private OffreService offreService;

    @Override
    public void init() throws ServletException {
        service = new CandidatureService();
        candidatService = new CandidatService();
        offreService = new OffreService();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String op = request.getParameter("op");

        int candidatId = Integer.parseInt(request.getParameter("candidat_id"));
        int offreId = Integer.parseInt(request.getParameter("offre_id"));
        String cvPath = request.getParameter("cvPath");
        String dateStr = request.getParameter("date"); // format yyyy-MM-dd HH:mm:ss

        Candidat candidat = candidatService.findById(candidatId);
        Offre offre = offreService.findById(offreId);

        Date date;
        try {
            if (dateStr != null && !dateStr.isEmpty()) {
                date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dateStr);
            } else {
                date = new Date();
            }
        } catch (Exception e) {
            date = new Date(); // fallback si parsing échoue
        }

        if (op == null) {
            // CREATE
            Candidature candidature = new Candidature(offre, candidat, date, cvPath);
            service.create(candidature);
            response.sendRedirect("candidatures/page.jsp");

        } else if (op.equals("delete")) {
            CandidaturePK pk = new CandidaturePK(offre, candidat, date);
            Candidature candidature = service.findById(pk);
            service.delete(candidature);
            response.sendRedirect("candidatures/page.jsp");

        } else if (op.equals("update")) {
            CandidaturePK pk = new CandidaturePK(offre, candidat, date);
            Candidature obj = service.findById(pk);
            response.sendRedirect("candidatures/page.jsp?"
                    + "candidat_id=" + obj.getCandidat().getId()
                    + "&offre_id=" + obj.getOffre().getId()
                    + "&cvPath=" + obj.getCvPath()
                    + "&date=" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(obj.getDate()));
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
        return "CandidatureController Servlet";
    }
}
