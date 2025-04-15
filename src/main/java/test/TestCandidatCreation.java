package test;

import dao2.CandidatDao;
import entities.Candidat;

public class TestCandidatCreation {
    public static void main(String[] args) {
        CandidatDao dao = new CandidatDao();
        Candidat c = new Candidat("Ali", "aliii@gmail.com", "pass123", "0611223344");
        dao.create(c);
        System.out.println("Candidat ajouté : " + c.getNom());
    }
}