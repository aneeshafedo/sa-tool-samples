import reservation_api.fares_api;
import reservation_api.seat_allocation_api;

type Flight record {
    readonly string flightNumber;
    readonly string flightDate;
    int available;
    int totalCapacity;
};

public type Reservation record {|
    string flightNumber;
    string origin;
    string destination;
    string flightDate;
    int seats;
    int...;
|};

type FlightBasicDetails record {|
    seat_allocation_api:Flight flight;
    fares_api:Fare? fare;
    ConfirmedReservation[]|Reservation[] totalReservations;
    seat_allocation_api:SeatAllocation seats?;
    Availability[] availability;
|};

type Availability record {|
    FlightBasicDetails flightData;
    boolean isAvailable;
|};

type ConfirmedReservation record {
    readonly int id;
    string flightNumber;
    string origin;
    string destination;
    string flightDate;
    string bookingDate;
    float fare;
    int seats;
    BookingStatus status;
};

enum BookingStatus {
    NEW,
    BOOKING_CONFIRMED,
    CHECKED_IN
}

type USAFlight record {
    *Flight;
    string state;
    string county;
};