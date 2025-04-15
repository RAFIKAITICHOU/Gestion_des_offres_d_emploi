/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entities;

import javax.persistence.*;
import java.util.Date;
import java.io.Serializable;
import java.util.Objects;

/**
 *
 * @author ichou
 */
@Entity
public class Candidature {

    @Embeddable
    public static class CandidaturePK implements Serializable {

        @ManyToOne
        private Offre offre;

        @ManyToOne
        private Candidat candidat;

        @Temporal(TemporalType.TIMESTAMP)
        private Date date;

        public CandidaturePK() {
        }

        public CandidaturePK(Offre offre, Candidat candidat, Date date) {
            this.offre = offre;
            this.candidat = candidat;
            this.date = date;
        }

        public Offre getOffre() {
            return offre;
        }

        public void setOffre(Offre offre) {
            this.offre = offre;
        }

        public Candidat getCandidat() {
            return candidat;
        }

        public void setCandidat(Candidat candidat) {
            this.candidat = candidat;
        }

        public Date getDate() {
            return date;
        }

        public void setDate(Date date) {
            this.date = date;
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) {
                return true;
            }
            if (!(o instanceof CandidaturePK)) {
                return false;
            }
            CandidaturePK that = (CandidaturePK) o;
            return Objects.equals(offre, that.offre)
                    && Objects.equals(candidat, that.candidat)
                    && Objects.equals(date, that.date);
        }

        @Override
        public int hashCode() {
            return Objects.hash(offre, candidat, date);
        }
    }

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
        return id.getOffre();
    }

    public Candidat getCandidat() {
        return id.getCandidat();
    }

    public Date getDate() {
        return id.getDate();
    }
}
