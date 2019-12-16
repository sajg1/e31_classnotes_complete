package com.example.codeclan.course_service.projections;

import com.example.codeclan.course_service.models.Booking;
import com.example.codeclan.course_service.models.Course;
import com.example.codeclan.course_service.models.Customer;
import org.springframework.data.rest.core.config.Projection;

@Projection(name = "embedCourseAndCustomer", types = Booking.class)
public interface EmbedCourseAndCustomer {
    String getDate();
    Course getCourse();
    Customer getCustomer();
}
