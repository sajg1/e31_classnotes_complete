public class FlightManager {

    public static int baggageWeight(Flight flight) {
        int totalBaggageWeight = 0;
        for(Passenger passenger : flight.getPassengers()){
            int baggageWeight = passenger.getBags() * 10;
            totalBaggageWeight += baggageWeight;
        }
        return totalBaggageWeight;
    }

    public static int remainingBaggageWeight(Flight flight){
        int reservedBaggageWeight = flight.getPlane().getWeight()/2;
        return reservedBaggageWeight - baggageWeight(flight);
    }


    public static int baggagePerPassenger(Flight flight) {
        int reservedBaggageWeight = flight.getPlane().getWeight()/2;
        int passengers = flight.getPlane().getCapacity();
        return reservedBaggageWeight/passengers;
    }
}
