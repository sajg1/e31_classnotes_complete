package com.example.pirateservice.respositories;

import com.example.pirateservice.models.Ship;
import com.example.pirateservice.projections.EmbedPirateForShip;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(excerptProjection = EmbedPirateForShip.class)
public interface ShipRespository extends JpaRepository<Ship, Long> {
}
