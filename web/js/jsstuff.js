var Firebase = require("firebase");
var myFirebaseRef = new Firebase("https://testrhackaburg16.firebaseio.com/experiments");

var date = myFirebaseRef.child("Datum");
var end = myFirebaseRef.child("Ende");
var name = myFirebaseRef.child("Name");
var location = myFirebaseRef.child("Ort");
var start = myFirebaseRef.child("Start");


myFirebaseRef.on("value", function(snapshot) {
  // console.log(snapshot.val());
  var data = snapshot.val();
  console.log(data);
  var items = [];

  $.each(data, function(i, item) {
    console.log(item);
    // <p id="name">Experiment Name</p>
    // <ul class="left">
    //     <p class="duration"></p>
    //     <p class="category"></p>
    //     <p class="reward"></p>
    // </ul>
    // <ul class="right">
    //     <p class="amount">5 von 10</p>
    //     <p class="time">13:00-15:00 Uhr</p>
    //     <p class="location">PT-Cafete</p>
    // </ul>
  items.push('<p id="name">'+item+'</p><ul class="left">');
  items.push('<li class="duration">Duration: '+item.starttime+" until "+item.endtime+'</li>');
  items.push('<li class="category">Category: '+item.category+'</li>');
  items.push('<li class="reward">Reward: '+item.reward+'</li>');
  items.push('</ul>');
  items.push('<ul class="right">');
  items.push('<li class="amount">Amount: '+item.amount+'</li>');
  items.push('<li class="time">Time:'+item.starttime+" until "+item.endtime+'</li>');
  items.push('<li class="location">Location: '+item.location+'</li>');
  items.push('</ul>');


  });  // close each()

  $('#experiments').append( items.join('') );
  // $(".list").html(data.Datum);

}, function (errorObject) {
  console.log("The read failed: " + errorObject.code);
});
