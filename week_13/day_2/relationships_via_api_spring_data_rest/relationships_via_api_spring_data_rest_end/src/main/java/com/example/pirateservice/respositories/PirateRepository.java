package com.example.pirateservice.respositories;

import com.example.pirateservice.models.Pirate;
import com.example.pirateservice.projections.EmbedAllForPirates;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(excerptProjection = EmbedAllForPirates.class)
public interface PirateRepository extends JpaRepository<Pirate, Long> {
}
