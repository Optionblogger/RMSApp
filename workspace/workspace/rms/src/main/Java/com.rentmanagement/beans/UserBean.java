package com.rentmanagement.beans;


import com.rentmanagement.common.Constants;
import com.rentmanagement.common.Helper;
import com.rentmanagement.common.JLogger;
import com.rentmanagement.model.User;
import com.rentmanagement.dao.UserDAO;


import javax.ejb.Local;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

/**
 */
@Local
@Stateless
public class UserBean implements UserBeanI {
    @PersistenceContext
    private EntityManager entityManager;
    JLogger jLogger = new JLogger(this.getClass());
    Helper helper = new Helper();

    @Override
    public User findByUsername(String username) {
        UserDAO dao = new UserDAO(entityManager);
        return dao.findByUsername(username);
    }

    @Override
    public User findUserByUsernameAndProfile(String username, String profile) {
        UserDAO dao = new UserDAO(entityManager);
        return dao.findUserByUsernameAndProfile(username, profile);
    }

    @Override
    public User findUser(String username, String password) {
        UserDAO dao = new UserDAO(entityManager);
        password = helper.hash(password);
        jLogger.i("Username is : " + username + ", Password is: " + password);
        return dao.findUser(username, password);
    }

    @Override
    public User findById(long id) {
        UserDAO dao = new UserDAO(entityManager);
        return dao.findById(id);
    }

    @Override
    public List<User> dormants(String from, String to) {
        UserDAO dao = new UserDAO(entityManager);
        return dao.dormants(from, to);
    }

    @Override
    public User edit(User user) {

        UserDAO dao = new UserDAO(entityManager);
        return dao.merge(user);
    }

    @Override
    public int countAdministrators(String userProfile) {
        UserDAO dao = new UserDAO(entityManager);
        return dao.countAdmins(userProfile);
    }

    @Override
    public boolean delete(User user) {
        UserDAO dao = new UserDAO(entityManager);
        return dao.remove(user);
    }

    @Override
    public List<User> findByStatus() {
        UserDAO dao = new UserDAO(entityManager);
        return dao.findByStatus();
    }

    @Override
    public List<User> findAll(String search, int offset, int limit) {
        UserDAO dao = new UserDAO(entityManager);
        return dao.findAll();
    }

    @Override
    public User findBySecurityCode(String securityCode) {
        UserDAO dao = new UserDAO(entityManager);
        return dao.findBySecurityCode(securityCode);
    }

    @Override
    public User findByActivationCode(String activationCode) {
        UserDAO dao = new UserDAO(entityManager);
        return dao.findByActivationCode(activationCode);


    }


    @Override
    public int countAll(String search) {
        UserDAO dao = new UserDAO(entityManager);
        return dao.countAll(search);
    }

    @Override
    public User find(String username, String profile) {
        UserDAO dao = new UserDAO(entityManager);
        return dao.find(username, profile);
    }
}
