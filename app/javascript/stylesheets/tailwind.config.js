/** @type {import('tailwindcss').Config} */
module.exports = {
  mode: 'jit',
  purge: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
  ],
  // content: [
  //   './node_modules/flowbite/**/*.js'
  // ],
  theme: {
    extend: {
      backgroundImage: (theme) => ({
        'top-image': "url('../../assets/images/top.jpg')",
      }),
    },
  },
  // plugins: [
  //   require('flowbite/plugin')
  // ],
  important: true,
};