onclick = e => {
    if (e.target.tagName === "P") {
        //TODO
    }
}

var slideIndex = 0;
showSlides();
function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    if (slides === undefined || slides.length == 0) { return }
    else {
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slideIndex++;
        if (slideIndex > slides.length) {
            slideIndex = 1
        }
        slides[slideIndex - 1].style.display = "block";
        setTimeout(showSlides, 5000); // Change image every 2 seconds
    }

}

//slider

$(document).ready(function() {
    $("#slider").bxSlider({
      auto: true,
      minSlides: 1,//how many slides on shown at the same time
      maxSlides: 1,
      slideWidth: 1250,
      slideMargin: 10,
      randomStart: true,//for random
      captions: true,//for bottom image texts
      autoHover: true,//photo not change while hovering th emouse
      pause: 3000,//3 sec
      pagerType: "short"
    });
});