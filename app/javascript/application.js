import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import "./header"
import Swiper from "https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js";

document.addEventListener("turbo:load", () => {
  new Swiper('.swiper', {
    loop: true,
    pagination: { el: '.swiper-pagination' },
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
  });
});

const cardSwiper = new Swiper(".card-swiper", {
  slidesPerView: 'auto',
  spaceBetween: 16,
  freeMode: true,   // ← スムーズに指でスライドできる
  scrollbar: {
    el: ".swiper-scrollbar",
    draggable: true,
  },
});
