/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers;

/**
 *
 * @author ichou
 */
import com.google.gson.Gson;
import entities.Offre;
import services.OffreService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "StatistiquesController", urlPatterns = {"/StatistiquesController"})
public class StatistiquesController extends HttpServlet {

    private OffreService offreService;

    @Override
    public void init() throws ServletException {
        offreService = new OffreService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Offre> offres = offreService.findAll();

        // Préparer les stats : nombre d’offres par entreprise
        Map<String, Integer> stats = new HashMap<>();
        for (Offre o : offres) {
            String entreprise = o.getEntreprise().getNom();
            stats.put(entreprise, stats.getOrDefault(entreprise, 0) + 1);
        }

        // Retourner en JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        out.print(new Gson().toJson(stats));
        out.flush();
    }
}

