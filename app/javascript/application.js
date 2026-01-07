import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import "./header"
import Swiper from "swiper";
import "swiper/css";
import "swiper/css/navigation";
import "swiper/css/pagination";
import "swiper/css/scrollbar";
import "./favorites"
import "./audio_navigation"


document.addEventListener("turbo:load", () => {

  // ★ 通常スライダー
  new Swiper('.swiper', {
    loop: true,
    pagination: { el: '.swiper-pagination' },
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
  });

  // ★ 自動スクロールするカードスライダー
  new Swiper(".card-swiper", {
    slidesPerView: 'auto',
    spaceBetween: 16,
    freeMode: true,
    scrollbar: {
      el: ".swiper-scrollbar",
      draggable: true,
    },
  });

});
