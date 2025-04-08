/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package util;

/**
 *
 * @author ichou
 */
import dao2.EntrepriseDao;
import entities.Entreprise;

public class Test {
    public static void main(String[] args) {
        EntrepriseDao entrepriseDao = new EntrepriseDao();

        Entreprise e = new Entreprise();
        e.setNom("TechCorp");
        e.setSecteur("Informatique");

        boolean success = entrepriseDao.create(e);

        if (success) {
            System.out.println("Entreprise enregistrée avec succès !");
        } else {
            System.out.println("Échec de l’enregistrement !");
        }
    }
}

