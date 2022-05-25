
const bouton = document.querySelector(".details");
const detailsJapon = document.querySelectorAll(".detailsJapon");
const detailsGrece = document.querySelectorAll(".detailsGrece");
const detailsCaribous = document.querySelectorAll(".detailsCaribous");


function clickDetailsJapon() {
    const blockDetails = document.querySelector("#blockDetailsJapon");
    blockDetails.classList.remove("blockDetailsJapon");
}

function crossJapon(){
    const blockDetails = document.querySelector("#blockDetailsJapon");
    blockDetails.classList.add("blockDetailsJapon");
}


function clickDetailsGrece() {
    const blockDetails = document.querySelector("#blockDetailsGrece");
    blockDetails.classList.remove("blockDetailsGrece");
}

function crossGrece(){
    const blockDetails = document.querySelector("#blockDetailsGrece");
    blockDetails.classList.add("blockDetailsGrece");
}

function clickDetailsCaribous() {
     const blockDetails = document.querySelector("#blockDetailsCaribous");
    blockDetails.classList.remove("blockDetailsCaribous");

}

function crossCaribous(){
    const blockDetails = document.querySelector("#blockDetailsCaribous");
    blockDetails.classList.add("blockDetailsCaribous");
}


const allCircuit = document.querySelectorAll("h1");
const cherche = document.getElementById("chercheCircuit");





cherche.addEventListener("keypress",chercheCircuit);

function chercheCircuit(press){
    
    if (press.key == 'Enter'){
        let val = String(cherche.value).toLowerCase();
        console.log("1");
        let trouve = false;
        
        for(let i=0;i<allCircuit.length;i++){
            console.log(allCircuit[i].textContent);
            if( (allCircuit[i].textContent.toLowerCase().includes(val))&&(val!="")) {
                const positionScreen = document.body.getBoundingClientRect();
                if (i==0){
                    trouve = true;
                    const positionJapon = document.getElementById("Japon").getBoundingClientRect();
                    window.scrollTo(0,(positionJapon.top-positionScreen.top+90));
                }
                if(i==1){
                    trouve=true;
                    const positionGrece = document.getElementById("Grece").getBoundingClientRect();
                    window.scrollTo(0,positionGrece.top-positionScreen.top+90);
                }
                if(i==2){
                    trouve=true;
                    const positionCaribous = document.getElementById("Caribous").getBoundingClientRect();
                    window.scrollTo(0,positionCaribous.top-positionScreen.top+90);
                }
            
            }
        }
        if ((trouve==false) &&(val!=""))
        alert("Désolé, nous n'avons pas trouvé votre circuit.");
        
    cherche.value="";
    
    }

   

}

