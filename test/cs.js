fetch('http://api.weatherapi.com/v1/current.json?key=9c814d122736458db8452447240903&q=Addis Ababa&aqi=yes' ).then(response => {response.json().then(data => {console.log(data)})})


//wite fettch for get request
