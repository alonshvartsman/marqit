const previewImageOnFileSelect = () => {
  // we select the photo input
  const input = document.getElementById('photo');
  if (input) {
    // we add a listener to know when a new picture is uploaded
    input.addEventListener('change', () => {
      // we call the displayPreview function (who retrieve the image url and display it)
      displayPreview(input);
    })
  }
}

const displayPreview = (input) => {
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = (event) => {
  console.log(event)
      document.getElementById('photo-preview').src = event.currentTarget.result;
    }
    reader.readAsDataURL(input.files[0])
    document.getElementById('photo-preview').classList.remove('hidden');
  }
}
const displayText = () => {
const nextButton = document.querySelector('.next_button_3');
  nextButton.addEventListener('click', (event) => {
    const description = document.getElementById('input-description-box').value
    const target = document.getElementById('target')
    target.innerHTML = description

    const locationForMap = document.querySelector('.mapboxgl-ctrl-geocoder--input').value
    const targetLocation = document.getElementById('mapLocation')
    mapLocation.innerHTML = locationForMap

    const categorySelected = document.querySelector("input[type='radio']:checked").value
    const categoryReview = document.getElementById('review_category')
    categoryReview.innerHTML = categorySelected
  })
};
export { previewImageOnFileSelect, displayText };

