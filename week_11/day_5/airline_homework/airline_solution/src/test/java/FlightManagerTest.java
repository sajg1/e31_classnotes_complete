import org.junit.Before;
import org.junit.Test;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import static org.junit.Assert.assertEquals;

public class FlightManagerTest {

    Plane plane;
    Passenger passenger;
    Flight flight;

    @Before
    public void setup(){
        plane = new Plane(PlaneType.WEEPLANE);
        passenger = new Passenger("Colin", 2);
        Date date = new GregorianCalendar(2018, Calendar.NOVEMBER, 18).getTime();
        flight = new Flight(plane, "CB123", AirportName.GLA, AirportName.EDI, date);

        flight.bookPassenger(passenger);
    }

    @Test
    public void canCalculateBaggageWeight(){
        assertEquals(20, FlightManager.baggageWeight(flight));
    }

    @Test
    public void canCalculateRemainingBaggageWeight(){
        assertEquals(5, FlightManager.remainingBaggageWeight(flight));
    }

    @Test
    public void canCalculateBaggagePerPassenger(){
        assertEquals(25, FlightManager.baggagePerPassenger(flight));
    }

}
