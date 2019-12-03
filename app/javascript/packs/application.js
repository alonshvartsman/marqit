import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

// --------------catagory slection javaScript

const categories = document.querySelectorAll(".report_category");
console.log(categories);
console.log("pop")
categories.forEach((category) => {
  category.addEventListener("click", (event) => {
    categories.forEach((category) => {
      category.classList.remove('change_border');
    });
    event.currentTarget.classList.toggle("change_border");
    const button = event.currentTarget.dataset.category;
    const buttonChecked = document.getElementById(`report_category${button}`);
    buttonChecked.checked = true;
  });
});

// const constraints = {
//   video: true
// };

// const takePicture = document.getElementById("snap")


// fetch('http://localhost:3000/report', {

// })
