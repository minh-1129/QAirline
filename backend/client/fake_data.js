const { faker } = require('@faker-js/faker');

seed = 18022004;
faker.seed(seed);

// baseURL = `http://localhost:1803`;
// apiURL = `${baseURL}/api/v1`;
// aircraftsURL = `${apiURL}/aircrafts`;
// seatsURL = `${apiURL}/seats`;
// flightsURL = `${apiURL}/flights`;
// bookingsURL = `${apiURL}/bookings`;
// seatsURL = `${apiURL}/seats`;
// usersURL = `${apiURL}/users`;
// passengersURL = `${apiURL}/passengers`;

function createAircraft() {
    return {
        aircraft_manufacturer: faker.company.name(),
        aircraft_name: faker.airline.airplane().name,
        aircraft_model: faker.airline.aircraftType(),
        capacity: 40,
    };
}