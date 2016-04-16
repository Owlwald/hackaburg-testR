var Firebase = require("firebase");
var myFirebaseRef = new Firebase("https://testrhackaburg16.firebaseio.com/experiments");

var date = myFirebaseRef.child("Datum");
var end = myFirebaseRef.child("Ende");
var name = myFirebaseRef.child("Name");
var location = myFirebaseRef.child("Ort");
var start = myFirebaseRef.child("Start");

// myFirebaseRef.on("child_changed", function(snapshot) {
//   var changedPost = snapshot.val();
//   console.log("The updated post title is " + changedPost);
// });
// myFirebaseRef.on("child_added", function(snapshot) {
//     var items = [];
//   console.log("The updated post title is " + changedPost);
// });
myFirebaseRef.on("value", function(snapshot) {
  $('#experiments').html('');
  var data = snapshot.val();

  var items = [];

  $.each(data, function(i, item) {
    console.log(item);
    var state;
    if(item.available){
      state = "bg-primary";

  items.push('<div class="row '+state+'">');
  items.push('<div class="col-sm-12"><h3><p id="name">'+item.name+'</p></h3></div>');

  items.push('<div class="col-sm-6"><dl class="dl-horizontal">');
  items.push('<dt class="duration">Duration: </dt><dd>'+item.duration+'</dd>');
  items.push('<dt class="category">Category: </dt><dd>'+item.category+'</dd>');
  items.push('<dt class="reward">Reward: </dt><dd>'+item.reward+'</dd>');
  items.push('</dl></div>');
  items.push('<div class="col-sm-6"><dl  class="dl-horizontal">');
  items.push('<dt class="amount">Amount: </dt><dd>'+item.amount+'</dd>');
  items.push('<dt class="time">Time: </dt><dd>'+item.starttime+" until "+item.endtime+'</dd>');
  items.push('<dt class="location">Location: </dt><dd>'+item.location+'</dd>');
  items.push('</dl></div></div>');
}else{
  state = "bg-danger";
}
  });

$('#experiments').append( items.join('') );


}, function (errorObject) {
  console.log("The read failed: " + errorObject.code);
});
