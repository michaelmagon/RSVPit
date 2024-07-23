import { Controller } from '@hotwired/stimulus';
import Swiper from 'swiper';
import { Navigation, Pagination, FreeMode, Autoplay } from 'swiper/modules';

export default class extends Controller {
  static targets = ["container", 'next', 'prev']

  connect() {
    this.swiper = new Swiper(this.containerTarget, {
      modules: [Navigation, Pagination, FreeMode, Autoplay],
      slidesPerView: 4,
      spaceBetween: 10,
      // Responsive breakpoints
      breakpoints: {
        // when window width is >= 320px
        320: {
          slidesPerView: 3
        },
        // when window width is >= 480px
        480: {
          slidesPerView: 3
        },
        // when window width is >= 640px
        640: {
          slidesPerView: 2
        }
      },
      freeMode: true,
      delay: 2000,
      navigation: {
        nextEl: this.prevTarget,
        prevEl: this.nextTarget,
      },
    });

    this.swiper.autoplay.start();
  }
}