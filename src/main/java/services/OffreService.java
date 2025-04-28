package services;

import dao2.OffreDao;
import entities.Offre;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

public class OffreService implements IService<Offre> {

    private final OffreDao dao;

    public OffreService() {
        this.dao = new OffreDao();
    }

    @Override
    public boolean create(Offre o) {
        return dao.create(o);
    }

    @Override
    public boolean delete(Offre o) {
        return dao.delete(o);
    }

    @Override
    public boolean update(Offre o) {
        return dao.update(o);
    }

    @Override
    public List<Offre> findAll() {
        return dao.findAll();
    }

    @Override
    public Offre findById(int id) {
        return dao.findById(id);
    }

    public Map<String, Integer> getNombreOffresParEntreprise() {
        List<Offre> all = findAll();
        Map<String, Integer> map = new HashMap<>();

        for (Offre o : all) {
            String nomEntreprise = o.getEntreprise().getNom();
            map.put(nomEntreprise, map.getOrDefault(nomEntreprise, 0) + 1);
        }

        return map;
    }

}
