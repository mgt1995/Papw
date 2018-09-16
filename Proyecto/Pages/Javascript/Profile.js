

function myFunction(clicked_id) {
    var idPressed = document.getElementById(clicked_id);
    var history = document.getElementById("historyContainer");
    var sale = document.getElementById("soldContainer");
    var draft = document.getElementById("draftContainer");
    var profile = document.getElementById("profileContainer");
   
    if (idPressed == history) {
        history.style.display = "block";
        sale.style.display = "none";
        draft.style.display = "none";
        profile.style.display = "none";
    } 
	else if (idPressed == sale) {
        sale.style.display = "block";
        history.style.display = "none";
        draft.style.display = "none";
        profile.style.display = "none";
    } 
    else if (idPressed == draft) {
        draft.style.display = "block";
        history.style.display = "none";
        sale.style.display = "none";
        profile.style.display = "none";
    }
    else if (idPressed == profile) {
        profile.style.display = "block";
        history.style.display = "none";
        sale.style.display = "none";
        draft.style.display = "none";
    }  
	    
}


