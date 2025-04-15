package test;

import dao2.EntrepriseDao;
import dao2.OffreDao;
import entities.Entreprise;
import entities.Offre;

public class TestOffreCreation {
    public static void main(String[] args) {
        EntrepriseDao entrepriseDao = new EntrepriseDao();
        Entreprise entreprise = new Entreprise("TechCorp", "IT");
        entrepriseDao.create(entreprise);

        OffreDao offreDao = new OffreDao();
        Offre offre = new Offre("Backend Dev", "Spring Boot expert", 9000, "CDD", entreprise);
        offreDao.create(offre);

        System.out.println("Offre enregistrée : " + offre.getTitre());
    }
}