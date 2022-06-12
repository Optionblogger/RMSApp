package com.rentmanagement.beans;


import javax.ejb.Local;
import java.util.List;
import com.rentmanagement.model.Logo;
@Local
public interface LogoBeanI {

	Logo add(Logo logo);
	boolean delete(Logo logo);
	List<Logo> find();
	Logo findById(long id);
	List<Logo> findAll();
}
