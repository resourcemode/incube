/**
 * Main JS
 *
 */

var fetchAll,
    searchAutoComplete,
    fetchBusById,
    displayBuses,
    dateTime;

function fetchAll() {
    $.getJSON("http://localhost/~michaelfavila/mfapi/main.php/api/bus",
        function(data) {
            var locationNames = [];
            $.each(data, function(key, values) {
                displayBuses(
                    values.bus_number, 
                    values.bus_name, 
                    values.location_name, 
                    values.location_distance,
                    values.bus_speed
                );
            });
        }
    );
}

function calculate(distance, speed) {
    var $_1k = 1000;
    var $_1kph = '0.277777778';
    var $eta = 0;
    var $hours, $mins, $secs, $seconds;
    
    $seconds = (distance * $_1k) / (speed * $_1kph);
    $hours = Math.floor($seconds / 3600);
    $mins  = Math.floor(($seconds - ($hours * 3600)) / 60);
    $secs  = Math.floor($seconds % 6);
    if ($hours >= 1) {
        return $hours + ' hours ' + 'and ' + $mins + ' mins ' + $secs + ' secs ';
    } else {
        return $mins + ' mins ' + $secs + ' secs ';
    }
}

function displayBuses(busNo, busName, busLocation, busDistance, busSpeed) {   
    if (typeof busNo !== 'undefined') {
        busTiming = calculate(busDistance, busSpeed);
        if (busTiming !== null) {
            timing = 'No Estimate Time Available';
        } else {
            timing = busTiming;
        }
        
        var push = false;
        $("#search").on('input', function() {
            searchString = $("#search").val();
            if (searchString.toLowerCase() === busLocation.toLowerCase()) {
                if (push === false) {
                    populate();
                    push = true;
                }
                if ($("#search").keyup(function(e) {
                    if (e.keyCode === 8 || e.keyCode === 46) {              
                        $("#infoTable").replaceWith(
                            "<table id='infoTable' class='table table-bordered table-hover'>" +
                            "<tr class='active'><th class='text-center text-info'>Bus No</th>" +
                            "<th class='text-center text-info'>Bus Name</th>" +
                            "<th class='text-center text-info'>Next Bus Arriving</th></tr></table>"
                        );
                        push = false;
                    }
                }));
            }
        });

        function populate(busDistance, busSpeed) {
               $("#infoTable").append(
                "<tr><td class='text-center text-danger'>" + busNo + "</td>"  +  
                "<td class='text-center text-danger'>" + busName + "</td>"   +
                "<td class='text-center text-danger'>" + busTiming + "</td></tr>"
            );
        }
    } 
}

function searchAutoComplete() {
    fetchAll();
}
