package services;

import dao2.CandidatureDao;
import entities.Candidature;
import entities.CandidaturePK;

import java.util.List;
import org.hibernate.Session;
import util.HibernateUtil;

public class CandidatureService {

    private final CandidatureDao dao;

    public CandidatureService() {
        dao = new CandidatureDao();
    }

    public boolean create(Candidature obj) {
        return dao.create(obj);
    }

    public boolean update(Candidature obj) {
        return dao.update(obj);
    }

    public boolean delete(Candidature obj) {
        return dao.delete(obj);
    }

    public List<Candidature> findAll() {
        return dao.findAll();
    }

    public Candidature findById(CandidaturePK pk) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Candidature candidature = session.get(Candidature.class, pk);
        session.close();
        return candidature;
    }

}
