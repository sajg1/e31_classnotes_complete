import Vue from 'vue';

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: "#app",
    data: {
      accounts: [
        { name: "Daniella Ellicombe", balance: 600 },
        { name: "Barbara Rabson", balance: 750 },
        { name: "James Schofield", balance: 200 },
        { name: "Irma Diloway", balance: 1200 }
      ],
      newAccount: {
        name: "",
        balance: 0
      }
    },
    methods: {
      saveAccount: function(){
        
        this.accounts.unshift(this.newAccount);

        this.newAccount = {
          name: "",
          balance: 0
        };
      }
    }
  })
});
