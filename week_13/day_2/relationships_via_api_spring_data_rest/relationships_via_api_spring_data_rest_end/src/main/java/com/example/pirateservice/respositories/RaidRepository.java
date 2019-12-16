package com.example.pirateservice.respositories;

import com.example.pirateservice.models.Raid;
import com.example.pirateservice.projections.EmbedPirateForRaids;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(excerptProjection = EmbedPirateForRaids.class)
public interface RaidRepository extends JpaRepository<Raid, Long> {
}
