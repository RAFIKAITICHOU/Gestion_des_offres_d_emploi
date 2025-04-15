/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entities;

import javax.persistence.*;
import java.util.Date;

/**
 *
 * @author ichou
 */

@Entity
public class Candidature {

    @EmbeddedId
    private CandidaturePK id;

    private String cvPath;

    public Candidature() {
    }

    public Candidature(Offre offre, Candidat candidat, Date date, String cvPath) {
        this.id = new CandidaturePK(offre, candidat, date);
        this.cvPath = cvPath;
    }

    public CandidaturePK getId() {
        return id;
    }

    public void setId(CandidaturePK id) {
        this.id = id;
    }

    public String getCvPath() {
        return cvPath;
    }

    public void setCvPath(String cvPath) {
        this.cvPath = cvPath;
    }

    public Offre getOffre() {
        return id != null ? id.getOffre() : null;
    }

    public Candidat getCandidat() {
        return id != null ? id.getCandidat() : null;
    }

    public Date getDate() {
        return id != null ? id.getDate() : null;
    }
}
