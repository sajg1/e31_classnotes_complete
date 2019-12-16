package com.example.codeclan.course_service.repositories.CourseRepository;

import com.example.codeclan.course_service.models.Course;
import com.example.codeclan.course_service.models.Customer;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.util.List;

public class CourseRepositoryImpl implements CourseRepositoryCustom {

    @Autowired
    EntityManager entityManager;

    @Transactional
    public List<Course> getCoursesForStarRating(int rating){
        List<Course> results = null;
        Session session = entityManager.unwrap(Session.class);
        try {
            Criteria cr = session.createCriteria(Course.class);
            cr.add(Restrictions.eq("starRating", rating));
            results = cr.list();
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }

        return results;
    }

    @Transactional
    public List<Customer> getAllCustomersForCourse(Long id){
        List<Customer> results = null;
        Session session = entityManager.unwrap(Session.class);
        try {
            Criteria cr = session.createCriteria(Customer.class);
            cr.createAlias("bookings", "bookingAlias");
            // cr.createAlias("bookingAlias.course", "courseAlias");
            cr.add(Restrictions.eq("bookingAlias.course.id", id));
            results = cr.list();
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
        return results;
    }




    @Transactional
    public List<Customer> getAllCustomersForCourseInTown(Long id, String town){
        List<Customer> results = null;
        Session session = entityManager.unwrap(Session.class);
        try {
            Criteria cr = session.createCriteria(Customer.class);
            cr.add(Restrictions.eq("town", town));
            cr.createAlias("bookings", "bookingAlias");
            cr.createAlias("bookingAlias.course", "courseAlias");
            cr.add(Restrictions.eq("courseAlias.id", id));
            results = cr.list();
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
        return results;
    }

    @Transactional
    public List<Customer> getAllCustomersForCourseInTownOverAge(Long courseId, String town, int age){
        List<Customer> results = null;
        Session session = entityManager.unwrap(Session.class);
        try {
            Criteria cr = session.createCriteria(Customer.class);
            cr.add(Restrictions.eq("town", town));
            cr.add(Restrictions.gt("age", age));
            cr.createAlias("bookings", "bookingAlias");
            cr.createAlias("bookingAlias.course", "courseAlias");
            cr.add(Restrictions.eq("courseAlias.id", courseId));
            results = cr.list();
        } catch (HibernateException ex){
            ex.printStackTrace();
        }

        return  results;
    }
}
