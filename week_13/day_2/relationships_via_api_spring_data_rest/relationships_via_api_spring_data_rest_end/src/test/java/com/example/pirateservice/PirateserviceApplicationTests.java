package com.example.pirateservice;

import com.example.pirateservice.models.Pirate;
import com.example.pirateservice.models.Raid;
import com.example.pirateservice.models.Ship;
import com.example.pirateservice.respositories.PirateRepository;
import com.example.pirateservice.respositories.RaidRepository;
import com.example.pirateservice.respositories.ShipRespository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class PirateserviceApplicationTests {

	@Autowired
	PirateRepository pirateRepository;

	@Autowired
	ShipRespository shipRespository;

	@Autowired
    RaidRepository raidRepository;

	@Test
	public void contextLoads() {
	}

	@Test
	public void createPirate(){

	    Ship ship = new Ship("The Flying Dutchman");
	    shipRespository.save(ship);

		Pirate pirate = new Pirate("Jack", "Sparrow", 32, ship);
		pirateRepository.save(pirate);
	}

    @Test
    public void addPiratesAndRaids(){
        Ship ship = new Ship("The Flying Dutchman");
        shipRespository.save(ship);

        Pirate pirate1 = new Pirate("Jack", "Sparrow", 32, ship);
        pirateRepository.save(pirate1);

        Raid raid1 = new Raid("Tortuga", 100);
        raidRepository.save(raid1);

        raid1.addPirate(pirate1);
        raidRepository.save(raid1);

    }

}
