/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package test;

/**
 *
 * @author ichou
 */
import dao2.CandidatDao;
import dao2.EntrepriseDao;
import dao2.OffreDao;
import dao2.CandidatureDao;
import entities.Entreprise;
import entities.Offre;
import entities.Candidat;
import entities.Candidature;

import java.util.Date;
import java.util.List;

public class Test {

    public static void main(String[] args) {

        // DAO
        EntrepriseDao entrepriseDao = new EntrepriseDao();
        OffreDao offreDao = new OffreDao();
        CandidatDao candidatDao = new CandidatDao();
        CandidatureDao candidatureDao = new CandidatureDao();

        Entreprise entreprise = new Entreprise("DevSolutions", "Informatique");
        entrepriseDao.create(entreprise);

        Offre offre = new Offre(
                "Développeur Fullstack",
                "Développement d’applications web en Java et Angular.",
                9000,
                "CDI",
                entreprise
        );
        offreDao.create(offre);

        String email = "yassine@gmail.com";
        boolean existe = false;
        List<Candidat> candidats = candidatDao.findAll();
        for (Candidat c : candidats) {
            if (c.getEmail().equalsIgnoreCase(email)) {
                existe = true;
                break;
            }
        }

        Candidat candidat;
        if (!existe) {
            candidat = new Candidat("Yassine", email, "password", "0600000000");
            candidatDao.create(candidat);
        }

        candidat = candidatDao.findAll().stream()
                .filter(c -> c.getEmail().equalsIgnoreCase(email))
                .findFirst()
                .orElse(null);

        offre = offreDao.findAll().stream()
                .filter(o -> o.getTitre().equalsIgnoreCase("Développeur Fullstack"))
                .findFirst()
                .orElse(null);

        if (candidat != null && offre != null) {
            Candidature candidature = new Candidature(offre, candidat, new Date(), "cv_yassine.pdf");
            candidatureDao.create(candidature);
            System.out.println("Test terminé avec succès.");
        } else {
            System.out.println("Erreur : candidat ou offre non trouvés.");
        }
    }
}
