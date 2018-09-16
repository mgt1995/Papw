// SELECTING ALL TEXT ELEMENTS
function validaciones()                                   
{
  


var email = document.forms["registerForm"]["email"];
var password = document.forms["registerForm"]["pws1"];
var password_confirm = document.forms["registerForm"]["pws2"];
var name = document.forms["registerForm"]["name"];
var userimg = document.forms["registerForm"]["profilePic"];
var userback = document.forms["registerForm"]["coverPic"];


  
         
  if (email.value == "")                                  
  {
      window.alert("Please enter a valid e-mail address.");
      email.focus();
      return false;
  }

  if (email.value.indexOf("@", 0) < 0)                
  {
      window.alert("Please enter a valid e-mail address.");
      email.focus();
      return false;
  }

  if (email.value.indexOf(".", 0) < 0)                
  {
      window.alert("Please enter a valid e-mail address.");
      email.focus();
      return false;
  }


    if(password.value.length < 8) {
      alert("Error: Password must contain at least eight characters!");
      password.focus();
      return false;
    }
    if(password.value == username.value) {
      alert("Error: Password must be different from Username!");
      password.focus();
      return false;
    }
    re = /[0-9]/;
    if(!re.test(password.value)) {
      alert("Error: password must contain at least one number (0-9)!");
      password.focus();
      return false;
    }
    re = /[a-z]/;
    if(!re.test(password.value)) {
      alert("Error: password must contain at least one lowercase letter (a-z)!");
      password.focus();
      return false;
    }
    re = /[A-Z]/;
    if(!re.test(password.value)) {
      alert("Error: password must contain at least one uppercase letter (A-Z)!");
      password.focus();
      return false;
    }

     if (password.value == "")                                 
  {
      alert("Please enter a password.");
      password.focus();
      return false;
  }

    if (password.value != password_confirm.value) {
      alert("Error: Passwords do not match");
  return false;
}
  

 if (name.value == "")                                 
  {
      window.alert("Please enter your  name.");
      name.focus();
      return false;
  }

   if (userimg.value == "")                          
  {
      window.alert("Select an image for your avatar.");
      userimg.focus();
      return false;
  }

 if (userback.value == "")                          
  {
      window.alert("Select an image for the background.");
      userback.focus();
      return false;
  }
    return true;
}