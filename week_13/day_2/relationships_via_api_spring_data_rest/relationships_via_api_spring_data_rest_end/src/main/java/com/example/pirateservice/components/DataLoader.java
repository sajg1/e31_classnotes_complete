package com.example.pirateservice.components;

import com.example.pirateservice.models.Pirate;
import com.example.pirateservice.models.Raid;
import com.example.pirateservice.models.Ship;
import com.example.pirateservice.respositories.PirateRepository;
import com.example.pirateservice.respositories.RaidRepository;
import com.example.pirateservice.respositories.ShipRespository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

@Component
public class DataLoader implements ApplicationRunner {

    @Autowired
    PirateRepository pirateRepository;

    @Autowired
    ShipRespository shipRepository;

    @Autowired
    RaidRepository raidRepository;


    public DataLoader() {

    }

    public void run(ApplicationArguments args) {
        Ship dutchman = new Ship("The Flying Dutchman");
        shipRepository.save(dutchman);

        Ship pearl = new Ship("The Black Pearl");
        shipRepository.save(pearl);

        Pirate jack = new Pirate("Jack", "Sparrow", 32, pearl);
        pirateRepository.save(jack);

        Pirate john = new Pirate("John", "Silver", 55, dutchman);
        pirateRepository.save(john);

        Raid raid1 = new Raid("Tortuga", 100);
        raidRepository.save(raid1);

        Raid raid2 = new Raid("Treasure Island", 690);
        raidRepository.save(raid2);

        jack.addRaid(raid1);
        jack.addRaid(raid2);
        pirateRepository.save(jack);

        raid2.addPirate(john);
        raidRepository.save(raid2);

    }
}