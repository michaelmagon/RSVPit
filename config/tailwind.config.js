const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontSize: {
        xxs: '0.5rem',
      },
      colors: {
        ivory: {
          'base': '#fefae5'
        },
        marigold: {
          'base': '#ebc684'
        },
        burnt_orange: {
          'base': '#e07548'
        },
        rust: {
          'base': '#d09060'
        },
        light_greenery: {
          'base': '#cadebc'
        },
        green: {
          'light': '#5a624f',
          'dark': '#425333',
          'emerald': '#182604',
          'kelly': '#386000',
          'teal': '#13604b',
          'sage': '#759268',
          '10': '#f2f3f0',
          '25': '#e0e3dc',
          '50': '#d2d4cf',
          '75': '#94ab9b',
          '100': '#707d69'
        },
        brown: {
          'base': '#a95b26',
          '50': '#efebe9',
          '100': '#d7ccc8',
          '200': '#bcaaa4',
          '300': '#a1887f',
          '400': '#8d6e63',
          '500': '#795548',
          '600': '#6d4c41',
          '700': '#5d4037',
          '800': '#4e342e',
          '900': '#3e2723'
        }
      },
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        'gistesy': ['Gistesy', 'sans-serif'],
        'bellarosa': ['Andrea Bellarosa', 'sans-serif'],
        'minion-condensed': ["Minion Condensed", 'sans-serif'],
      },
      contrast: {
        25: '.25',
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
