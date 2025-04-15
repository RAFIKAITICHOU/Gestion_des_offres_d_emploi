/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entities;

import javax.persistence.Entity;

/**
 *
 * @author ichou
 */
@Entity
public class Candidat extends User {

    private String telephone;

    public Candidat() {
        super();
    }

    public Candidat(String nom, String email, String motDePasse, String telephone) {
        super(nom, email, motDePasse);
        this.telephone = telephone;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }
}
