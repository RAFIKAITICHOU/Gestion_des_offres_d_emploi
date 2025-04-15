/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao2;

/**
 *
 * @author ichou
 */
import entities.Candidature;
import entities.CandidaturePK;
import org.hibernate.Session;
import util.HibernateUtil;

public class CandidatureDao extends AbstractDao<Candidature> {

    public CandidatureDao() {
        super(Candidature.class);
    }

    public Candidature findById(CandidaturePK pk) {
        Candidature candidature = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            candidature = session.get(Candidature.class, pk);
        } catch (Exception e) {
            e.printStackTrace(); // ou log.error(e)
        }
        return candidature;
    }
}
