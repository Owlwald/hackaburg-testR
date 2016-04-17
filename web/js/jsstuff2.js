var myFirebaseRef = new Firebase("https://testrhackaburg16.firebaseio.com/experiments");

var submit_button = document.querySelector("#submit_button")
submit_button.addEventListener("click", onclick);


function onclick() {
    //var usersRef = myFirebaseRef.child("experiments");

    var name = document.querySelector("#input_name").value;
    var category = document.querySelector("#input_category").value;
    var duration = document.querySelector("#input_duration").value;

    var starttime = document.querySelector("#input_starttime").value;

    var endtime = document.querySelector("#input_endtime").value;

    var reward = document.querySelector("#input_reward").value;

    var location = document.querySelector("#input_location").value;

    var description = document.querySelector("#input_description").value;

    var date = document.querySelector("#input_date").value;

    myFirebaseRef.push({
        'name': name,
        'category':category,
        'duration': duration,
        'starttime':date+" "+starttime,
        'endtime':date+" "+endtime,
        'reward':reward,
        'location':location,
        'description':description,
        'available': true
    });
}

// var loginButton = document.querySelector("#login");
// loginButton.addEventListener("click",onclickk);

function onclickk(){
    console.log("click");
    myFirebaseRef.authWithOAuthPopup("google", authHandler);
}

function authHandler(error, authData) {
  if (error) {
    console.log("Login Failed!", error);
  } else {
    console.log("Authenticated successfully with payload:", authData);

  }
}
