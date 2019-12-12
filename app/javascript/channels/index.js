// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)


// const inputField = document.querySelector("#input");
// const letters = document.querySelectorAll('.letter');
// letters.forEach(letter => {
//   letter.addEventListener('click', () => {
//     inputField.value += letter.innerHTML;
//   });
// });
