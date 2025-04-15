/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entities;

import javax.persistence.Entity;


@Entity
public class Admin extends User {

    private String matricule;

    public Admin() {
        super();
    }

    public Admin(String nom, String email, String motDePasse, String matricule) {
        super(nom, email, motDePasse);
        this.matricule = matricule;
    }

    public String getMatricule() {
        return matricule;
    }

    public void setMatricule(String matricule) {
        this.matricule = matricule;
    }
}

