import attractions.Park;
import attractions.RollerCoaster;
import attractions.RollercoasterTest;
import behaviours.IReviewed;
import org.junit.Before;
import org.junit.Test;
import people.Visitor;
import stalls.CandyflossStall;
import stalls.ParkingSpot;
import stalls.TobaccoStall;

import java.util.ArrayList;
import java.util.HashMap;

import static org.junit.Assert.assertEquals;

public class ThemeParkTest {

    ThemePark themePark;
    RollerCoaster rollerCoaster;
    Park park;
    TobaccoStall tobaccoStall;
    CandyflossStall candyflossStall;
    Visitor visitor;

    @Before
    public void setUp() throws Exception {
        themePark = new ThemePark();
        rollerCoaster = new RollerCoaster("Blue Ridge", 10);
        park = new Park("Leafy Meadows", 9);
        tobaccoStall = new TobaccoStall("Jacks Drum", "Jack Jarvis", ParkingSpot.B1, 2);
        candyflossStall = new CandyflossStall("Candy Land", "Harry Belafonte", ParkingSpot.A1, 6);
        themePark.addAttraction(rollerCoaster);
        themePark.addAttraction(park);
        themePark.addStall(tobaccoStall);
        themePark.addStall(candyflossStall);
        visitor = new Visitor(14, 150, 20.0);
    }

    @Test
    public void canAddAttraction() {
        themePark.addAttraction(rollerCoaster);
        assertEquals(3, themePark.getAttractionCount());

    }

    @Test
    public void canAddStall() {
        themePark.addStall(candyflossStall);
        assertEquals(3, themePark.getStallCount());
    }

    @Test
    public void canGetAllRevied() {
        ArrayList<IReviewed> reviewed = themePark.getReviewed();
        assertEquals(4, reviewed.size());
    }

    @Test
    public void hasAllowedAttractions() {
        ArrayList<IReviewed> allowedAttractions = themePark.getAllAllowed(visitor);
        assertEquals(1, allowedAttractions.size());

    }

    @Test
    public void canVisitAttraction(){
        themePark.visit(visitor, rollerCoaster);
        assertEquals(1, rollerCoaster.getVisitCount());
        assertEquals(1, visitor.getAttractionCount());
    }

    @Test
    public void getReviews() {
        HashMap<String, Integer> result = new HashMap<String, Integer>();
        result.put("Blue Ridge", 10);
        result.put("Leafy Meadows", 9);
        result.put("Jacks Drum", 2);
        result.put("Candy Land", 6);
        assertEquals(result, themePark.allReviews());
    }
}
