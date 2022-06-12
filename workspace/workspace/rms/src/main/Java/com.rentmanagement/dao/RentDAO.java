package com.rentmanagement.dao;

import com.rentmanagement.dto.RentDTO;
import com.rentmanagement.dto.ServiceChargeDTO;
import com.rentmanagement.model.Rent;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class RentDAO extends GenericDAOImpl<Rent, Long> {

    private final EntityManager em;

    public RentDAO(EntityManager entityManager) {
        super(Rent.class, entityManager);
        em = entityManager;
    }

    public List<RentDTO> findAllByAllInvoicesAsat(Long propertyId, Date date) {

        Session session = (Session) em.getDelegate();
        String sql = "select r.id \"id\",coalesce(r.arrears,0) \"arrears\",coalesce(u.monthlyRent,0) \"monthlyRent\",u.unitNumber \"unitNumber\",t2.name \"tenantName\",m.name \"month\" r.year \"year\"  from tbl_rents r inner join tbl_units u on r.unit_id = u.id inner join tbl_tenants t2 on u.id = t2.unit_id\n" +
                "inner join tbl_months m on r.month_id = m.id where u.property_id=:property and r.paid='NO' and m.name=EXTRACT(MONTH FROM :date)";

        org.hibernate.Query query = session.createSQLQuery(sql)
                .setParameter("property", propertyId)
                .setParameter("date", date)
                .setResultTransformer(Transformers.aliasToBean(RentDTO.class));
        List<RentDTO> rentDTOS = query.list();
        if (rentDTOS.size() < 1)
            return null;
        else
            return rentDTOS;
    }


    public List<RentDTO> findAllPaidRent(Long propertyId) {
        System.out.println("property id  here  ....................." + propertyId);
        Session session = (Session) em.getDelegate();
        String sql = "select r.id \"id\",coalesce(r.amountPaid,0) \"amountPaid\",r.paid \"paid\",coalesce(r.arrears,0) \"arrears\",coalesce(u.monthlyRent,0) \"monthlyRent\",u.unitNumber \"unitNumber\",t2.name \"tenantName\",m.name \"month\", r.year \"year\"  from tbl_rents r" +
                " inner join tbl_units u on r.unit_id = u.id inner join tbl_tenants t2 on u.id = t2.unit_id\n" +
                "inner join tbl_months m on r.month_id = m.id where  r.paid='YES' and u.property_id=" + propertyId;

        org.hibernate.Query query = session.createSQLQuery(sql)
                .setResultTransformer(Transformers.aliasToBean(RentDTO.class));
        List<RentDTO> rentDTOS = query.list();
        if (rentDTOS.size() < 1)
            return null;
        else
            return rentDTOS;
    }

    public List<RentDTO> findPaidRent(Long propertyId, String fromDate, String toDate) {
        System.out.println("property id  here  ....................." + propertyId + " " + fromDate + " " + toDate);


        Session session = (Session) em.getDelegate();
        String sql = "SELECT r.id \"id\",coalesce(r.amountPaid,0) \"amountPaid\",r.paid \"paid\", coalesce(r.arrears,0) \"arrears\",coalesce(u.monthlyRent,0)  \"monthlyRent\",u.unitNumber \"unitNumber\",t2.name \"tenantName\",m.name \"month\",r.year \"year\",coalesce(r.amountToLandlord,0) \"amountToLandlord\",coalesce(r.amountToRgl,0) \"amountToRgl\" FROM tbl_rents r INNER JOIN tbl_units u ON r.unit_id = u.id INNER JOIN tbl_tenants t2 ON u.id = t2.unit_id INNER JOIN tbl_months m ON r.month_id = m.id WHERE r.paid = 'YES'" +
                " AND u.property_id =" + propertyId + " " +
                "AND r.datePaid BETWEEN '" + fromDate + "' and '" + toDate + "' ";

        org.hibernate.Query query = session.createSQLQuery(sql)
                .setResultTransformer(Transformers.aliasToBean(RentDTO.class));
        List<RentDTO> rentDTOS = query.list();
        System.out.println("Size of List is  ....................." + rentDTOS.size());
        if (rentDTOS.size() < 1)
            return null;
        else
            return rentDTOS;
    }

    public List<RentDTO> findRentArrears(Long propertyId, String fromDate, String toDate) {
        System.out.println("property id  here  ....................." + propertyId + " " + fromDate + " " + toDate);

        Session session = (Session) em.getDelegate();
        String sql = "SELECT r.id \"id\",coalesce(r.amountPaid,0) \"amountPaid\",r.paid \"paid\", coalesce(r.arrears,0) \"arrears\",coalesce(u.monthlyRent,0)  \"monthlyRent\",u.unitNumber \"unitNumber\",t2.name \"tenantName\",m.name \"month\",r.year \"year\",coalesce(r.amountToLandlord,0) \"amountToLandlord\",coalesce(r.amountToRgl,0) \"amountToRgl\" FROM tbl_rents r INNER JOIN tbl_units u ON r.unit_id = u.id INNER JOIN tbl_tenants t2 ON u.id = t2.unit_id INNER JOIN tbl_months m ON r.month_id = m.id WHERE r.paid = 'YES'" +
                " AND u.property_id =" + propertyId + " " +
                "and (r.arrears is not NULL  or arrears>0) " +
                "AND r.datePaid BETWEEN '" + fromDate + "' and '" + toDate + "' ";

        org.hibernate.Query query = session.createSQLQuery(sql)
                .setResultTransformer(Transformers.aliasToBean(RentDTO.class));
        List<RentDTO> rentDTOS = query.list();
        System.out.println("Size of List is  ....................." + rentDTOS.size());
        if (rentDTOS.size() < 1)
            return null;
        else
            return rentDTOS;
    }

    public List<RentDTO> findRentArrears(Long propertyId) {
        System.out.println("property id  here  ....................." + propertyId + "");

        Session session = (Session) em.getDelegate();
        String sql = "SELECT r.id \"id\",coalesce(r.amountPaid,0) \"amountPaid\",r.paid \"paid\", coalesce(r.arrears,0) \"arrears\",coalesce(u.monthlyRent,0)  \"monthlyRent\",u.unitNumber \"unitNumber\",t2.name \"tenantName\",m.name \"month\",r.year \"year\",coalesce(r.amountToLandlord,0) \"amountToLandlord\",coalesce(r.amountToRgl,0) \"amountToRgl\" FROM tbl_rents r INNER JOIN tbl_units u ON r.unit_id = u.id INNER JOIN tbl_tenants t2 ON u.id = t2.unit_id INNER JOIN tbl_months m ON r.month_id = m.id WHERE r.paid = 'YES'" +
                " AND u.property_id =" + propertyId + " " +
                "and (r.arrears is not NULL  or arrears>0) ";


        org.hibernate.Query query = session.createSQLQuery(sql)
                .setResultTransformer(Transformers.aliasToBean(RentDTO.class));
        List<RentDTO> rentDTOS = query.list();
        System.out.println("Size of List is  ....................." + rentDTOS.size());
        if (rentDTOS.size() < 1)
            return null;
        else
            return rentDTOS;
    }

    public List<RentDTO> findRentPrepaid(Long propertyId, String fromDate, String toDate) {
        System.out.println("property id  here  ....................." + propertyId + " " + fromDate + " " + toDate);

        Session session = (Session) em.getDelegate();
        String sql = "SELECT r.id \"id\",coalesce(r.amountPaid,0) \"amountPaid\",r.paid \"paid\", coalesce(r.arrears,0) \"arrears\",coalesce(u.monthlyRent,0)  \"monthlyRent\",u.unitNumber \"unitNumber\",t2.name \"tenantName\",m.name \"month\",r.year \"year\",coalesce(r.amountToLandlord,0) \"amountToLandlord\",coalesce(r.amountToRgl,0) \"amountToRgl\", coalesce(r.prepaidAmount,0) \"prepaidAmount\" FROM tbl_rents r INNER JOIN tbl_units u ON r.unit_id = u.id INNER JOIN tbl_tenants t2 ON u.id = t2.unit_id INNER JOIN tbl_months m ON r.month_id = m.id WHERE r.paid = 'YES'" +
                " AND u.property_id =" + propertyId + " " +
                " and (prepaidAmount is not NULL or prepaidAmount >0) " +
                "AND r.datePaid BETWEEN '" + fromDate + "' and '" + toDate + "' ";

        org.hibernate.Query query = session.createSQLQuery(sql)
                .setResultTransformer(Transformers.aliasToBean(RentDTO.class));
        List<RentDTO> rentDTOS = query.list();
        System.out.println("Size of List is  ....................." + rentDTOS.size());
        if (rentDTOS.size() < 1)
            return null;
        else
            return rentDTOS;
    }

    public List<RentDTO> findRentPrepaid(Long propertyId) {
        System.out.println("property id  here  ....................." + propertyId + "");

        Session session = (Session) em.getDelegate();
        String sql = "SELECT r.id \"id\",coalesce(r.amountPaid,0) \"amountPaid\",r.paid \"paid\", coalesce(r.arrears,0) \"arrears\",coalesce(u.monthlyRent,0)  \"monthlyRent\",u.unitNumber \"unitNumber\",t2.name \"tenantName\",m.name \"month\",r.year \"year\",coalesce(r.amountToLandlord,0) \"amountToLandlord\",coalesce(r.amountToRgl,0) \"amountToRgl\", coalesce(r.prepaidAmount,0) \"prepaidAmount\" FROM tbl_rents r INNER JOIN tbl_units u ON r.unit_id = u.id INNER JOIN tbl_tenants t2 ON u.id = t2.unit_id INNER JOIN tbl_months m ON r.month_id = m.id WHERE r.paid = 'YES'" +
                " AND u.property_id =" + propertyId + " " +
                " and (prepaidAmount is not NULL or prepaidAmount >0)";

        org.hibernate.Query query = session.createSQLQuery(sql)
                .setResultTransformer(Transformers.aliasToBean(RentDTO.class));
        List<RentDTO> rentDTOS = query.list();
        System.out.println("Size of List is  ....................." + rentDTOS.size());
        if (rentDTOS.size() < 1)
            return null;
        else
            return rentDTOS;
    }

    public Date addDays(Date date, int days) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.DATE, days);
        return new Date(cal.getTime().getTime());
    }

    public List<RentDTO> issueReceipts(String unitNumber, Long name, int year, Long propId) {
        Session session = (Session) em.getDelegate();
        String sql = "select coalesce(r.amountPaid,0)\"amountPaid\"" +
                ",coalesce(u.monthlyRent,0)\"monthlyRent\"," +
                "coalesce(r.amountToLandlord,0)\"amountToLandlord\"," +
                "coalesce(amountToRgl,0)\"amountToRgl\",coalesce(r.arrears,0)\"arrears\", " +
                "DATE_FORMAT(r.datePaid, '%d/%m/%Y')\"datePaidString\"," +
                "coalesce(r.prepaidAmount,0)\"prepaidAmount\",r.receiptNo\"receiptNo\"," +
                "m.name\"month\",u.unitNumber\"unitNumber\",t2.name\"tenantName\"" +
                ",r.year\"year\" from tbl_rents " +
                "r INNER JOIN  tbl_months m " +
                "ON r.month_id = m.id INNER JOIN tbl_units u " +
                "ON r.unit_id = u.id INNER  JOIN tbl_tenants t2 " +
                "ON u.id = t2.unit_id WHERE " +
                "u.unitNumber='" + unitNumber + "' " +
                "and m.id=" + name + " and" +
                " r.year=" + year + " and u.property_id=" + propId + "";

        org.hibernate.Query query = session.createSQLQuery(sql)
                .setResultTransformer(Transformers.aliasToBean(RentDTO.class));
        List<RentDTO> rentDTOS = query.list();
        System.out.println("Size of List is  ....................." + rentDTOS.size());

        if (rentDTOS.size() < 1)
            return null;
        else
            return rentDTOS;

    }

}
