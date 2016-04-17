var isNewUser = true;
var myFirebaseRef = new Firebase("https://testrhackaburg16.firebaseio.com/");
var authData = myFirebaseRef.getAuth();

myFirebaseRef.onAuth(function(authData) {
  if (authData && isNewUser) {
    // save the user's profile into the database so we can list users,
    // use them in Security and Firebase Rules, and show profiles
    myFirebaseRef.child("users").child(authData.uid).set({
      provider: authData.provider,
      name: authData.uid
    });
  }
});

var loginButtond = document.querySelector("#logind");
loginButtond.addEventListener("click",onclick);

function onclick(){
    if(authData){location.href="./my_experiments.html";}
    else{
    myFirebaseRef.authWithOAuthPopup("google", authHandler);}
}


var loginButton = document.querySelector("#login");
loginButton.addEventListener("click",onclickk);

function onclickk(){
    if(authData){
        console.log("gocreate");
        location.href="./create_experiment.html";
                }
    else{
    myFirebaseRef.authWithOAuthPopup("google", authHandler);}
}

function authHandler(error, authData) {
  if (error) {
    console.log("Login Failed!", error);
  } else {
    console.log("Authenticated successfully with payload:", authData);
    location.href="./create_experiment.html"
  }
}

$('#logout').on('click',function(){
  if(authData){
    myFirebaseRef.unauth(); 
  }
})
