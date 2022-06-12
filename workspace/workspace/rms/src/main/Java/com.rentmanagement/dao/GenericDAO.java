
package com.rentmanagement.dao;

import java.util.List;



interface GenericDAO<T> {

    T save(T entity);

    T merge(T entity);

    T findById(long id);

    boolean remove(T entity);

    List<T> findPaged(int start, int limit);

    List<T> findAll();

    List<T> customQuery(String s, String value);

    List<T> query(String query);

    List<T> findByObject(String s, Object o);

    long count();

}
