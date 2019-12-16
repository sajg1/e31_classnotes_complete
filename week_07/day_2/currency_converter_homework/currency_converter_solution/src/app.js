import Vue from 'vue';

document.addEventListener('DOMContentLoaded', () => {

  new Vue({
    el: '#app',
    data: {
      operations: ["Convert from Euros", "Convert to Euros", "Convert Cross Currency"],
      selectedOperation: "",
      rates: {},
      baseCurrency: "",
      convertedCurrency: "",
      amount: 0
    },
    computed: {
      convertFromEuros(){
        return this.amount * this.rates[this.baseCurrency];
      },
      convertToEuros(){
        return this.amount/this.rates[this.baseCurrency];
      },
      convertCrossCurrency(){
        return this.convertToEuros * this.rates[this.convertedCurrency];
      }
    },
    mounted(){
      fetch('https://api.exchangeratesapi.io/latest')
      .then(res => res.json())
      .then(res => {
        res.rates['EUR'] = 1;
        this.rates = res.rates;
      })
    },
    filters: {
      twoDecimalPlaces(num){
        return num.toFixed(2);
      }
    }
  })
})
