package com.codeclan.example.WhiskyTracker.repositories.DistilleryRepository;

import com.codeclan.example.WhiskyTracker.models.Distillery;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DistilleryRepository extends JpaRepository<Distillery, Long>, DistilleryRepositoryCustom {

    // Spring Data JPA Method ("Derived") Query (no body needed)
    List<Distillery> findDistilleriesByRegion(String region);

    // Custom Criteria query defined in DistilleryRepositoryImpl
    List<Distillery> getDistilleriesForWhiskiesAged(int age);
}
