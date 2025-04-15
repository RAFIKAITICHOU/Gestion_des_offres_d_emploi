package test;

import dao2.CandidatDao;
import dao2.OffreDao;
import dao2.CandidatureDao;
import entities.Candidat;
import entities.Offre;
import entities.Candidature;

import java.util.Date;

public class TestCandidatureCreation {
    public static void main(String[] args) {
        CandidatDao candidatDao = new CandidatDao();
        OffreDao offreDao = new OffreDao();
        CandidatureDao candidatureDao = new CandidatureDao();

        Candidat candidat = candidatDao.findAll().get(0);
        Offre offre = offreDao.findAll().get(0);

        Candidature candidature = new Candidature(offre, candidat, new Date(), "cv_alii.pdf");
        candidatureDao.create(candidature);

        System.out.println("Candidature créée pour " + candidat.getNom());
    }
}