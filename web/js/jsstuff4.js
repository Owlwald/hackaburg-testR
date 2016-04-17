var Firebase = require("firebase");
var myFirebaseRef = new Firebase("https://testrhackaburg16.firebaseio.com/experiments");

var myFirebaseRefUser = new Firebase("https://testrhackaburg16.firebaseio.com");
var authData = myFirebaseRefUser.getAuth();
var date = myFirebaseRef.child("Datum");
var end = myFirebaseRef.child("Ende");
var name = myFirebaseRef.child("Name");
var location = myFirebaseRef.child("Ort");
var start = myFirebaseRef.child("Start");


console.log(authData);

myFirebaseRef.orderByChild("starttime").on("value", function (snapshot) {
    $('#experiments').html('');
    var data = snapshot.val();

    var items = [];
    var cnt = 0;
    if (data.length != 0) {
        $.each(data, function (i, item) {

            console.log(item.uuid);
            var state;
            
            if (item.available && item.uuid === authData.uid) {
                state = "bg-primary";
                
                items.push('<div class="row '+ state + ' id_'+cnt+ '">');
                items.push('<div class="col-sm-12"><h3><p id="name">' + item.name + '</p></h3></div>');
                items.push('<div class="col-sm-6"><dl class="dl-horizontal">');
                items.push('<dt class="duration"><span class="glyphicon glyphicon-dashboard" aria-hidden="true"></span> </dt><dd>' + item.duration + ' min</dd>');
                items.push('<dt class="category"><span class="glyphicon glyphicon-tag" aria-hidden="true"></span> </dt><dd>' + item.category + '</dd>');
                items.push('<dt class="reward"><span class="glyphicon glyphicon-gift" aria-hidden="true"></span></dt><dd>' + item.reward + '</dd>');
                items.push('</dl></div>');
                items.push('<div class="col-sm-6"><dl  class="dl-horizontal">');
                items.push('<dt class="time"><span class="glyphicon glyphicon-time" aria-hidden="true"></span> </dt><dd>' + item.startdate + " until " + item.enddate + '</dd>');
                items.push('<dt class="location"></span><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span></dt><dd>' + item.location + '</dd>');
                items.push('</dl></div></div>');
                cnt++;
            } else {
                state = "bg-danger";
            }
        });

        $('#my_experiments').append(items.join(''));
    }



}, function (errorObject) {
    console.log("The read failed: " + errorObject.code);
});
