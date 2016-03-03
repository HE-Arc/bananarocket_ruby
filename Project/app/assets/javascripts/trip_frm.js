$( document ).ready(function() {

    $( ".trip-insert-radio" ).click(function() {
        $(this).find('.rbtn').attr('checked', 'checked');
    });
});

//
// Frm find place (MAPS API)
//

function initGeo() {
    var geocoder = new google.maps.Geocoder();

    $('#find_addr').focusout(function() {
        geocodeAddress(geocoder);
    });
}

function initGeoEdit() {
    var geocoder = new google.maps.Geocoder();

    //init load
    geocodeAddress(geocoder);

    $('#find_addr').focusout(function() {
        geocodeAddress(geocoder);
    });
}

function geocodeAddress(geocoder) {
    var address = document.getElementById('find_addr').value;
    geocoder.geocode({'address': address}, function(results, status) {
        if (status === google.maps.GeocoderStatus.OK) {
            //resultsMap.setCenter(results[0].geometry.location);
            //var marker = new google.maps.Marker({
            //  map: resultsMap,
            //  position: results[0].geometry.location
            //});

            var htmlcode = "";
            for(var i=0; i<results.length; i++){
                var line = "<div class='formated_adress'><span class='rbtn_adress_span'>";
                line += "<input class=\"rbtn\" type=\"radio\" name=\"stage[adress]\" value=\""+results[i].formatted_address+"\"";

                if(i==0){
                    line += " checked ";
                }

                line += "/></span><span><p>" + results[i].formatted_address+ "<br /><span class='gps_adress'>GPS:" + results[i].geometry.location + "</span></p></span>";
                line += "<div>";
                //var line = "<b>" + results[i].formatted_address + "</b><br />GPS : " + results[i].geometry.location + "<br/>";
                htmlcode += line;
            }

            $('#finded_adresses').html(htmlcode);
            $('#nb_results').text(results.length+" results")

        } else {

            if(status == 'ZERO_RESULTS'){
                $('#nb_results').text(0+" result")
            }
            else{
                $('#nb_results').text(status);
            }

        }
    });
}