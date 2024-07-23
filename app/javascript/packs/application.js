// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import 'stylesheets/application.css'
import 'controllers/index.js'
import 'swiper/css';
import 'swiper/css/navigation';
import 'swiper/css/pagination';


const stylesheets = require.context('../stylesheets', true)
const images = require.context('../images', true)
const imagePath = (name) => images(name, true)
console.log('application.js loaded')
