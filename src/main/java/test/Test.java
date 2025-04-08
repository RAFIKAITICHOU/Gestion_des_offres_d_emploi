/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package test;

/**
 *
 * @author ichou
 */
import dao2.EntrepriseDao;
import dao2.OffreDao;
import dao2.CandidatDao;
import dao2.CandidatureDao;
import entities.Entreprise;
import entities.Offre;
import entities.Candidat;
import entities.Candidature;

import java.util.Date;

public class Test {

    public static void main(String[] args) {
        EntrepriseDao entrepriseDao = new EntrepriseDao();
        Entreprise entreprise = new Entreprise("DevSolutions", "Informatique");
        entrepriseDao.create(entreprise);

        OffreDao offreDao = new OffreDao();
        Offre offre = new Offre();
        offre.setTitre("Développeur Fullstack");
        offre.setDescription("Développement d’applications web en Java et Angular.");
        offre.setSalaire(9000);
        offre.setTypeContrat("CDI");
        offre.setEntreprise(entreprise);
        offreDao.create(offre);

        CandidatDao candidatDao = new CandidatDao();
        Candidat candidat = new Candidat("Yassine", "yassine@gmail.com", "password", "0600000000");
        candidatDao.create(candidat);

        CandidatureDao candidatureDao = new CandidatureDao();
        Candidature candidature = new Candidature(offre, candidat, new Date(), "cv_yassine.pdf");
        candidatureDao.create(candidature);

        // Test affichage
        System.out.println("Test terminé avec succès.");
    }
}
