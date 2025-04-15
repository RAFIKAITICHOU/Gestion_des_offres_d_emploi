package entities;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

@Embeddable
public class CandidaturePK implements Serializable {

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
