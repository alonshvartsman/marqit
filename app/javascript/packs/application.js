import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
// import { confetti } from "canvas-confetti"
const confetti = require('canvas-confetti');

import { initMapbox } from '../plugins/init_mapbox';
import { readURL } from '../plugins/avatar_upload';
import { previewImageOnFileSelect, displayText } from '../plugins/snapshop';


initMapbox();
readURL();

const nextButton = document.querySelector('.next_button_3');

if(nextButton) {
  previewImageOnFileSelect();
  displayText();
}
// --------------catagory slection javaScript

const categories = document.querySelectorAll(".report_category");
if(categories) {

categories.forEach((category) => {
  category.addEventListener("click", (event) => {
    categories.forEach((category) => {
      category.classList.remove('change_border');
    });
    event.currentTarget.classList.toggle("change_border");
    const button = event.currentTarget.dataset.category;
    const buttonChecked = document.getElementById(`report_category${button}`);
    console.log(buttonChecked);
    buttonChecked.checked = true;
  });
});

}




const confettiParty = () => {

// myCanvas.style.


// confetti()


    var myConfetti = confetti.create(myCanvas, { resize: true });
     myConfetti({
      spread: 160,
      particleCount: 200,

      // any other options from the global
      // confetti function
    });




  if (Date.now() < document.end) {
    setTimeout(confettiParty, 2000);
  }

}

if (document.querySelector(".confirmation-container")) {
  document.duration = 30 * 1000;

  document.end = Date.now() + document.duration;
  var myCanvas = document.createElement('canvas');
  document.querySelector("body").appendChild(myCanvas);
  confettiParty()
}












