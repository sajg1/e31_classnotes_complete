package com.example.codeclan.course_service.repositories.BookingRepository;

import com.example.codeclan.course_service.models.Booking;
import com.example.codeclan.course_service.projections.EmbedCourseAndCustomer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.util.List;

@RepositoryRestResource(excerptProjection = EmbedCourseAndCustomer.class)
public interface BookingRepository extends JpaRepository<Booking, Long>, BookingRepositoryCustom {
    List<Booking> getAllBookingsForDate(String date);
}
