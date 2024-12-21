import axios from "axios";
const postData = async () => {
    const url = "http://112.137.129.161:1803/api/v1/flights";
    const data = {
      "aircraft_id": 1,
      "arrival_airport": "HAN",
      "arrival_time": "2024-12-12T02:10:20+07:00",
      "board_time": "2024-12-12T02:10:20+07:00",
      "departure_airport": "DAD",
      "departure_time": "2024-12-12T02:10:20+07:00",
      "flight_number": "VN123",
      "flight_id": 15,
      "gate": "A1",
      "status": "on-time",
    }

    try {
      // const response = await axios.delete(url, data, {
      //   headers: {
      //     "Content-Type": "application/json",
      //   },
      // });
      const response = await axios.get(url)
      console.log(response.data);
    } catch (error) {
      console.error("Error making  request:", error);
    }
  };