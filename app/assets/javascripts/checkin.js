function checkIn() {
    
    var result = document.getElementById("result");
    var delta = 0.01
    
    var checkInResult = document.getElementById("checkInSuccessOrFail");
    
    //should come from the controller method
    var schoolCoords = {longitude: 37.772728,
                        latitude: -122.2922217};
    
    if (!navigator.geolocation){
        result.innerHTML = "<p>Geolocation is not supported by your browser</p>";
        return;
    }

    function success(position) {
        var latitude  = position.coords.latitude;
        var longitude = position.coords.longitude;
    
        result.innerHTML = '<p>Latitude is ' + latitude + '° <br>Longitude is ' + longitude + '°</p>';
        if ((Math.abs(latitude - schoolCoords.latitude) < 0.01) && (Math.abs(longitude - schoolCoords.longitude))) {
            checkInResult.innerHTML = '<p style= "color:green; size: 16px;"> Check In Success! </p>'
        } else {
            checkInResult.innerHTML = '<p style= "color:red; size: 16px;"> Check In Fails, Not In site Range! </p>'
        }
    }
    
    function error(err) {
        result.innerHTML = '<p>Unable to retrieve your location</p>' +
                           'Error ' + err.code + ': ' + err.message;
    }
    
    navigator.geolocation.getCurrentPosition(success, error);
}