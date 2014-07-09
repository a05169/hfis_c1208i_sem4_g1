/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package biz;

import da.AccountJpaController;
import da.RequestJpaController;
import da.exceptions.RollbackFailureException;
import entity.Request;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceContext;
import javax.transaction.UserTransaction;

/**
 *
 * @author The
 */
@Stateless
@TransactionManagement(TransactionManagementType.BEAN)
public class RequestManager {

    @PersistenceContext(unitName = "eAdministrationPU")
    private EntityManagerFactory em;
    @Resource
    private UserTransaction utx;

    private RequestJpaController daController;

    public RequestJpaController getDaController() {
        if (daController == null) {
            daController = new RequestJpaController(utx, em);
        }
        return daController;
    }

    public List<Request> getRequests(String username) {
        return getDaController().getRequests(username);
    }

    public List<Request> getRequests() {
        return getDaController().getRequests();
    }

    public void create(Request request) {
        try {
            getDaController().create(request);
        } catch (RollbackFailureException ex) {
            Logger.getLogger(RequestManager.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(RequestManager.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void edit(Request request){
        try {
            getDaController().edit(request);
        } catch (RollbackFailureException ex) {
            Logger.getLogger(RequestManager.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(RequestManager.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void delete(int id){
        try {
            getDaController().destroy(id);
        } catch (RollbackFailureException ex) {
            Logger.getLogger(RequestManager.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(RequestManager.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}