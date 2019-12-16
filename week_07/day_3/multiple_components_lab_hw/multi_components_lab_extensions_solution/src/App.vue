<template lang="html">
  <div>
    <h1>Countries</h1>
    <country-filter-form :countries="countries" />
    <country-detail />
  </div>
</template>

<script>
import CountryFilterForm from './components/CountryFilterForm.vue'
import CountryDetail from './components/CountryDetail.vue'

export default {
  data(){
    return {
      countries: [],
    }
  },
  components: {
    "country-filter-form": CountryFilterForm,
    "country-detail": CountryDetail
  },
  mounted(){
    fetch('https://restcountries.eu/rest/v2/all')
    .then(res => res.json())
    .then(countries => this.countries = countries)
  }
}
</script>

<style lang="css" scoped>
h1 {
  text-align: center;
  color: #333;
}
</style>
