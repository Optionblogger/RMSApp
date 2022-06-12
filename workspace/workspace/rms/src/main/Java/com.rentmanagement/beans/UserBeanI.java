package com.rentmanagement.beans;

import com.rentmanagement.model.User;


import javax.ejb.Local;
import java.util.List;

/**
 */
@Local
public interface UserBeanI {
    User findByUsername(String username);

    User findUserByUsernameAndProfile(String username, String profile);

    User findUser(String username, String password);

    List<User> dormants(String from, String to);

    List<User> findByStatus();

    List<User> findAll(String search, int offset, int limit);

    User findBySecurityCode(String securityCode);

    User findByActivationCode(String activationCode);

    int countAll(String search);

    User find(String username, String profile);

    User findById(long id);

    User edit(User user);

    boolean delete(User user);

    int countAdministrators(String userProfile);
}
