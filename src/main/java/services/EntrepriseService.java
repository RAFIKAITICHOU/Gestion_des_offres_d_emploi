package services;

import dao2.EntrepriseDao;
import entities.Entreprise;

import java.util.List;

public class EntrepriseService implements IService<Entreprise> {

    private final EntrepriseDao dao;

    public EntrepriseService() {
        this.dao = new EntrepriseDao();
    }

    @Override
    public boolean create(Entreprise o) {
        return dao.create(o);
    }

    @Override
    public boolean delete(Entreprise o) {
        return dao.delete(o);
    }

    @Override
    public boolean update(Entreprise o) {
        return dao.update(o);
    }

    @Override
    public List<Entreprise> findAll() {
        return dao.findAll();
    }

    @Override
    public Entreprise findById(int id) {
        return dao.findById(id);
    }
}
