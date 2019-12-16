package com.example.pirateservice.projections;

import com.example.pirateservice.models.Pirate;
import com.example.pirateservice.models.Raid;
import com.example.pirateservice.models.Ship;
import org.springframework.data.rest.core.config.Projection;

import java.util.List;

@Projection(name = "embedPirateForRaids", types = Raid.class)
public interface EmbedPirateForRaids {
    String getLocation();
    int getLoot();
    List<Pirate> getPirates();
}
