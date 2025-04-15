package services;

import dao2.CandidatDao;
import entities.Candidat;

import java.util.List;

public class CandidatService implements IService<Candidat> {

    private final CandidatDao dao;

    public CandidatService() {
        this.dao = new CandidatDao();
    }

    @Override
    public boolean create(Candidat o) {
        return dao.create(o);
    }

    @Override
    public boolean delete(Candidat o) {
        return dao.delete(o);
    }

    @Override
    public boolean update(Candidat o) {
        return dao.update(o);
    }

    @Override
    public List<Candidat> findAll() {
        return dao.findAll();
    }

    @Override
    public Candidat findById(int id) {
        return dao.findById(id);
    }
}
