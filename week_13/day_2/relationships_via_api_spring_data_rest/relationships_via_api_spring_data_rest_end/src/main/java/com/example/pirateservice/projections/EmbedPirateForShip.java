package com.example.pirateservice.projections;

import com.example.pirateservice.models.Pirate;
import com.example.pirateservice.models.Ship;
import org.springframework.data.rest.core.config.Projection;

import java.util.List;

@Projection(name = "embedPirateForShip", types = Ship.class)
public interface EmbedPirateForShip {
    String getName();
    List<Pirate> getPirates();
}
