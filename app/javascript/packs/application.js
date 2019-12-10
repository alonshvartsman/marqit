import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import { initMapbox } from '../plugins/init_mapbox';
import { readURL } from '../plugins/avatar_upload';
import { previewImageOnFileSelect, displayText } from '../plugins/snapshop';

initMapbox();
readURL();
previewImageOnFileSelect();
displayText();








// --------------catagory slection javaScript

const categories = document.querySelectorAll(".report_category");
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

