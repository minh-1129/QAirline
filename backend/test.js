fetch('http://112.137.129.161:1803/api/v1/aircrafts/1', {
    method: 'GET',
    headers: {
      'accept': 'application/json'
    },
  })
    .then(response => {
      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`);
      }
      return response.json();
    })
    .then(data => console.log(data))
    .catch(error => console.error('Error:', error));