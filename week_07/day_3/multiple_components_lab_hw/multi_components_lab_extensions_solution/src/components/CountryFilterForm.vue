<template lang="html">
  <form v-on:submit.prevent>
    <input type="text" v-model="search" placeholder="search for country..." v-on:keyup="searchForCountry">
    <select v-on:change="handleSelect" v-model="selectedCountry">
      <option disabled value="">Select a country...</option>
      <option v-for="country in countries" :value="country">{{country.name}}</option>
    </select>
  </form>
</template>

<script>
import { eventBus } from '../main.js'

export default {
  name: "country-filter-form",
  data(){
    return {
      "search": "",
      "selectedCountry": {},
    }
  },
  props: ["countries"],
  methods: {
    searchForCountry(){
      let foundCountry = this.countries.find((country) => {
        return country.name.toLowerCase().indexOf(this.search.toLowerCase()) > -1
      })
      this.selectedCountry = foundCountry

      eventBus.$emit('country-selected', this.selectedCountry)
    },
    handleSelect(){
      this.search = ""
      eventBus.$emit('country-selected', this.selectedCountry)
    }
  }
}
</script>

<style lang="css" scoped>
form{
  text-align: center;
  margin: 40px 0;
}

select, input[type="text"]{
  font-size: 18px;
}

select {
  margin-left: 20px;
}
</style>
