package com.example.pirateservice.projections;

import com.example.pirateservice.models.Pirate;
import com.example.pirateservice.models.Raid;
import com.example.pirateservice.models.Ship;
import org.springframework.data.rest.core.config.Projection;

import java.util.List;

@Projection(name = "embedAllForPirates", types = Pirate.class)
public interface EmbedAllForPirates {
    String getFirstName();
    String getLastName();
    int getAge();
    Ship getShip();
    List<Raid> getRaids();
}