// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import 'stylesheets/application.css'
import 'controllers/index.js'

const stylesheets = require.context('../stylesheets', true)
const images = require.context('../images', true)
const imagePath = (name) => images(name, true)
console.log('application.js loaded')
