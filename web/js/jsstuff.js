var Firebase = require("firebase");
var myFirebaseRef = new Firebase("https://testrhackaburg16.firebaseio.com/experiments");
var data;
myFirebaseRef.orderByChild("unixtime").on("value", function(snapshot) {
  $('#experiments').html('');
   data = snapshot.val();
   console.log("data",data);
  var items = [],cnt = 0;
if(data.length != 0){
  $('#experiments').append('<div class="row"');
  $.each(data, function(i, item) {
  var prev;

  var state;
  if(item.available){
    state = "lightblue";
    items.push('<div id="'+cnt+'" class="items rounded col-sm-8 col-sm-offset-2 '+state+'">');
    items.push('<div class="row items">');
    items.push('<div class="col-sm-12 "><h3 class="list-h3"><p id="name">'+item.name+'</p></h3></div>');
    items.push('<div class="col-sm-6"><dl class="dl-horizontal">');
    items.push('<dt class="duration"><span class="glyphicon glyphicon-dashboard" aria-hidden="true"></span> </dt><dd>'+item.duration+' min</dd>');
    items.push('<dt class="category"><span class="glyphicon glyphicon-tag" aria-hidden="true"></span> </dt><dd>'+item.category+'</dd>');
    items.push('<dt class="reward"><span class="glyphicon glyphicon-gift" aria-hidden="true"></span></dt><dd>'+item.reward+'</dd>');
    items.push('</dl></div>');
    items.push('<div class="col-sm-6"><dl  class="dl-horizontal">');
    items.push('<dt class="time"><span class="glyphicon glyphicon-time" aria-hidden="true"></span> </dt><dd>'+item.startdate+" until "+item.enddate+'</dd>');
    items.push('<dt class="location"></span><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span></dt><dd>'+item.location+'</dd>');
    items.push('</dl></div></div></div>');
    cnt++;

}else{
  state = "bg-danger";
}
  });

$('#experiments').append( items.join('') );
$('#experiments').append('</div>');

}

}, function (errorObject) {
  console.log("The read failed: " + errorObject.code);
});


$("#experiments").on('click','> *', function(e){

    var clicked = $(this).attr('id');
    console.log(clicked);
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


  console.log("key",found);

  var detailRef = new Firebase("https://testrhackaburg16.firebaseio.com/experiments/"+found);
  detailRef.on("value", function(snapshot) {
    // $('#experiments').html('');
    var detaildata = snapshot.val();
    console.log("detail",detaildata);
      $('#myModal').modal('show');
      $('#expName').text(detaildata.name);
      $('#description').text(detaildata.description);


    // var state = 'bg-primary';
    // var items = [];
    //
    // items.push('<div id="" class="items col-sm-8 col-sm-offset-2 '+state+'">');
    // items.push('<div class="row items '+state+'">');
    // items.push('<div class="col-sm-8 "><h3><p id="name">'+detaildata.name+'</p></h3></div>');
    // items.push('<div class="col-sm-6"><dl class="dl-horizontal">');
    // items.push('<dt class="duration"><span class="glyphicon glyphicon-dashboard" aria-hidden="true"></span> </dt><dd>'+detaildata.duration+' min</dd>');
    // items.push('<dt class="category"><span class="glyphicon glyphicon-tag" aria-hidden="true"></span> </dt><dd>'+detaildata.category+'</dd>');
    // items.push('<dt class="reward"><span class="glyphicon glyphicon-gift" aria-hidden="true"></span></dt><dd>'+detaildata.reward+'</dd>');
    // items.push('</dl></div>');
    // items.push('<div class="col-sm-6"><dl  class="dl-horizontal">');
    // items.push('<dt class="time"><span class="glyphicon glyphicon-time" aria-hidden="true"></span> </dt><dd>'+detaildata.startdate+" until "+detaildata.enddate+'</dd>');
    // items.push('<dt class="location"></span><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span></dt><dd>'+detaildata.location+'</dd>');
    // items.push('</dl></div></div></div>');
    // $('#experiments').append( items.join('') );
    // $('#experiments').append('</div>');

  });

});
