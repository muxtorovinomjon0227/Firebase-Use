# untitled

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


/// https://foodish-api.herokuapp.com/images/burger/burger20.jpg  
https://foodish-api.herokuapp.com/images/pasta/pasta2.jpg
https://coffee.alexflipnote.dev/random
Shun  apidan   
gamburgerlarni  rasmini olib kelamiz   oxiridagi  soni o'zgarsa burgerni  rasmi ham o'zgaradi 

///   Bunda   vibraytsiyalar  bilan ishalash va  Registrasa bilan ishlangan uilar bor

const axios = require("axios");

const options = {
method: 'GET',
url: 'https://movie-database-alternative.p.rapidapi.com/',
params: {s: 'Avengers Endgame', r: 'json', page: '1'},
headers: {
'X-RapidAPI-Key': '8be2ecc607msh598077496d9a17ap126369jsnfaf826d76475',
'X-RapidAPI-Host': 'movie-database-alternative.p.rapidapi.com'
}
};

axios.request(options).then(function (response) {
console.log(response.data);
}).catch(function (error) {
console.error(error);
});#   F i r e b a s e - U s e  
 