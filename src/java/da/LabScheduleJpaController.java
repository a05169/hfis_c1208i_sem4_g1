/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package da;

import da.exceptions.NonexistentEntityException;
import da.exceptions.PreexistingEntityException;
import da.exceptions.RollbackFailureException;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import entity.Account;
import entity.Lab;
import entity.LabSchedule;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;

/**
 *
 * @author The
 */
public class LabScheduleJpaController implements Serializable {

    public LabScheduleJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(LabSchedule labSchedule) throws PreexistingEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Account requestAccount = labSchedule.getRequestAccount();
            if (requestAccount != null) {
                requestAccount = em.getReference(requestAccount.getClass(), requestAccount.getUsername());
                labSchedule.setRequestAccount(requestAccount);
            }
            Lab labId = labSchedule.getLabId();
            if (labId != null) {
                labId = em.getReference(labId.getClass(), labId.getId());
                labSchedule.setLabId(labId);
            }
            em.persist(labSchedule);
            if (requestAccount != null) {
                requestAccount.getLabScheduleList().add(labSchedule);
                requestAccount = em.merge(requestAccount);
            }
            if (labId != null) {
                labId.getLabScheduleList().add(labSchedule);
                labId = em.merge(labId);
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findLabSchedule(labSchedule.getId()) != null) {
                throw new PreexistingEntityException("LabSchedule " + labSchedule + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(LabSchedule labSchedule) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            LabSchedule persistentLabSchedule = em.find(LabSchedule.class, labSchedule.getId());
            Account requestAccountOld = persistentLabSchedule.getRequestAccount();
            Account requestAccountNew = labSchedule.getRequestAccount();
            Lab labIdOld = persistentLabSchedule.getLabId();
            Lab labIdNew = labSchedule.getLabId();
            if (requestAccountNew != null) {
                requestAccountNew = em.getReference(requestAccountNew.getClass(), requestAccountNew.getUsername());
                labSchedule.setRequestAccount(requestAccountNew);
            }
            if (labIdNew != null) {
                labIdNew = em.getReference(labIdNew.getClass(), labIdNew.getId());
                labSchedule.setLabId(labIdNew);
            }
            labSchedule = em.merge(labSchedule);
            if (requestAccountOld != null && !requestAccountOld.equals(requestAccountNew)) {
                requestAccountOld.getLabScheduleList().remove(labSchedule);
                requestAccountOld = em.merge(requestAccountOld);
            }
            if (requestAccountNew != null && !requestAccountNew.equals(requestAccountOld)) {
                requestAccountNew.getLabScheduleList().add(labSchedule);
                requestAccountNew = em.merge(requestAccountNew);
            }
            if (labIdOld != null && !labIdOld.equals(labIdNew)) {
                labIdOld.getLabScheduleList().remove(labSchedule);
                labIdOld = em.merge(labIdOld);
            }
            if (labIdNew != null && !labIdNew.equals(labIdOld)) {
                labIdNew.getLabScheduleList().add(labSchedule);
                labIdNew = em.merge(labIdNew);
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = labSchedule.getId();
                if (findLabSchedule(id) == null) {
                    throw new NonexistentEntityException("The labSchedule with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            LabSchedule labSchedule;
            try {
                labSchedule = em.getReference(LabSchedule.class, id);
                labSchedule.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The labSchedule with id " + id + " no longer exists.", enfe);
            }
            Account requestAccount = labSchedule.getRequestAccount();
            if (requestAccount != null) {
                requestAccount.getLabScheduleList().remove(labSchedule);
                requestAccount = em.merge(requestAccount);
            }
            Lab labId = labSchedule.getLabId();
            if (labId != null) {
                labId.getLabScheduleList().remove(labSchedule);
                labId = em.merge(labId);
            }
            em.remove(labSchedule);
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<LabSchedule> findLabScheduleEntities() {
        return findLabScheduleEntities(true, -1, -1);
    }

    public List<LabSchedule> findLabScheduleEntities(int maxResults, int firstResult) {
        return findLabScheduleEntities(false, maxResults, firstResult);
    }

    private List<LabSchedule> findLabScheduleEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(LabSchedule.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public LabSchedule findLabSchedule(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(LabSchedule.class, id);
        } finally {
            em.close();
        }
    }

    public int getLabScheduleCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<LabSchedule> rt = cq.from(LabSchedule.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}