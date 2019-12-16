import Vue from 'vue';

document.addEventListener("DOMContentLoaded", () => {
  new Vue({
    el: "#app",
    data: {
      countries: [],
      selectedCountry: null,
      favouriteCountries: []
    },
    computed: {
      globalPopulation: function(){
        return this.populationCalculator(this.countries);
      },
      neighbouringCountries: function(){
        return this.countries.filter(country => this.selectedCountry.borders.includes(country.alpha3Code));
      },
      neighbouringCountriesPopulation: function(){
        return this.populationCalculator(this.neighbouringCountries);
      }
    },
    mounted(){
      this.getCountries()
    },
    methods: {
      getCountries: function(){
        fetch("https://restcountries.eu/rest/v2/all")
        .then(res => res.json())
        .then(countries => this.countries = countries)
      },
      addToFavourites: function(){
        this.favouriteCountries.push(this.selectedCountry)
      },
      populationCalculator: function(countries){
        return countries.reduce((runningTotal, country) => runningTotal + country.population, 0);
      }
    }
  })
})
