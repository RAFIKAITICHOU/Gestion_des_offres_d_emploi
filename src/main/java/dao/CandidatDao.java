/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author ichou
 */

import entities.Candidat;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.HibernateException;
import util.HibernateUtil;

import java.util.List;

public class CandidatDao implements IDao<Candidat> {

    @Override
    public boolean create(Candidat o) {
        Session session = null;
        Transaction tx = null;
        boolean etat = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.save(o);
            tx.commit();
            etat = true;
        } catch (HibernateException e) {
            if (tx != null) tx.rollback();
        } finally {
            if (session != null) session.close();
        }
        return etat;
    }

    @Override
    public boolean delete(Candidat o) {
        Session session = null;
        Transaction tx = null;
        boolean etat = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.delete(o);
            tx.commit();
            etat = true;
        } catch (HibernateException e) {
            if (tx != null) tx.rollback();
        } finally {
            if (session != null) session.close();
        }
        return etat;
    }

    @Override
    public boolean update(Candidat o) {
        Session session = null;
        Transaction tx = null;
        boolean etat = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.update(o);
            tx.commit();
            etat = true;
        } catch (HibernateException e) {
            if (tx != null) tx.rollback();
        } finally {
            if (session != null) session.close();
        }
        return etat;
    }

    @Override
    public List<Candidat> findAll() {
        Session session = null;
        Transaction tx = null;
        List<Candidat> candidats = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            candidats = session.createQuery("from Candidat", Candidat.class).list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) tx.rollback();
        } finally {
            if (session != null) session.close();
        }
        return candidats;
    }

    @Override
    public Candidat findById(int id) {
        Session session = null;
        Transaction tx = null;
        Candidat candidat = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            candidat = session.get(Candidat.class, id);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) tx.rollback();
        } finally {
            if (session != null) session.close();
        }
        return candidat;
    }
}
