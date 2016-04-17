var Firebase = require("firebase");
var myFirebaseRef = new Firebase("https://testrhackaburg16.firebaseio.com/experiments");

var myFirebaseRefUser = new Firebase("https://testrhackaburg16.firebaseio.com");
var authData = myFirebaseRefUser.getAuth();
var d = Date.now();

// console.log(authData);

myFirebaseRef.orderByChild('unixtime').startAt(d).on("value", function (snapshot) {
  $('#experiments').html('');
   data = snapshot.val();
  //  console.log("data",data);
  var items = [],cnt = 0;
if(data.length != 0){
  $('#experiments').append('<div class="row"');
  $.each(data, function(i, item) {
    // console.log("uuid",item.uuid);
    // console.log("auth",authData.uid);
    if(item.uuid === authData.uid){

  var prev;

  var state;
  var state_txt;
  if(item.available){
    state = "brightgreen";
    state_txt = "Active";
    stateb ="success";
  }else{
    state = "brightred";
    state_txt = "Not active ";
    stateb = "danger";
  }


    items.push('<div id="'+cnt+'" class="items rounded col-sm-8 col-sm-offset-2 '+state+'">');
    items.push('<div class="row items">');
    items.push('<div class="col-sm-10 list-h3"><h3 class="h3"><p id="name">'+item.name+'</p></h3></div>');

    items.push('<div class="list-h3 col-sm-2"> <button type="button" id="state_btn" class=" btn btn-'+stateb+' btn-sm">'+state_txt+'</button></div>');
    // items.push('<div class="row">');
    items.push('<div class="col-sm-6"><dl class="dl-horizontal">');
    items.push('<dt class="duration"><span class="glyphicon glyphicon-dashboard" aria-hidden="true"></span> </dt><dd>'+item.duration+' min</dd>');
    items.push('<dt class="category"><span class="glyphicon glyphicon-tag" aria-hidden="true"></span> </dt><dd>'+item.category+'</dd>');
    items.push('<dt class="reward"><span class="glyphicon glyphicon-gift" aria-hidden="true"></span></dt><dd>'+item.reward+'</dd>');
    items.push('</dl></div>');
    items.push('<div class="col-sm-6"><dl  class="dl-horizontal">');
    items.push('<dt class="time"><span class="glyphicon glyphicon-time" aria-hidden="true"></span> </dt><dd>'+item.startdate+'</dd>');
    items.push('<dt class="time"><span class="glyphicon " aria-hidden="true"></span> </dt><dd>'+item.enddate+'</dd>');

    items.push('<dt class="location"></span><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span></dt><dd>'+item.location+'</dd>');
    items.push('</dl></div></div></div>');
    cnt++;


}else{
  cnt++;
}
  });

$('#my_experiments').append( items.join('') );
$('#my_experiments').append('</div>');

}

}, function (errorObject) {
  // console.log("The read failed: " + errorObject.code);
});

$("#my_experiments").on('click','> *', function(e){

    var clicked = $(this).attr('id');
    // console.log(clicked);
    var counter = 0;
    var found;
    for (var key in data) {
      if(counter == clicked){
         found = key;
        break;
      }
       found = key;
       counter++;
  }
  // console.log(found);
  var switchref = new Firebase("https://testrhackaburg16.firebaseio.com/experiments/"+found);
  switchref.on("value", function(snapshot) {


    var switchdata = snapshot.val();
    $('#confModal').modal('show');

    var curr = switchdata.available;
    console.log(curr);
    console.log(!curr);



    $('#confirm').on('click',function(){
       
      if(curr){
          $('#my_experiments').html('');
        switchref.child('available').set(false);
      }else{
          $('#my_experiments').html('');
        switchref.child('available').set(true);
      }

    });



  });
});
