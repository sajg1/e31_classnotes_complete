<template lang="html">
  <div v-if="country" id="countryDetail">
    <div id="detailWrapper">
      <h2>{{country.name}}</h2>
      <div id="flexWrapper">
        <div id="left">
          <p><span>Capital</span>: {{country.capital}}</p>
          <p><span>Population</span>: {{country.population}}</p>
          <p><span>Languages</span>:</p>
          <ul v-for="language in country.languages">
            <li>{{language.name}}</li>
          </ul>
        </div>
        <div id="right">
          <img :src="country.flag" :alt="country.name">
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'country-detail',
  props: ['country']
}
</script>

<style lang="css" scoped>
  #countryDetail {
    box-sizing: border-box;
    height: 400px;
    width: 60%;
    background: #eee;
    color: #222;
    padding: 10px;
    border: 1px solid #ccc;
  }

  #detailWrapper {
    box-sizing: border-box;
    background: #fff;
    padding: 10px;
    height: 100%;
    border-radius: 3px;
  }

  #flexWrapper {
    display: flex;
    justify-content: space-between;
  }

  #left, #right {
    width: 45%;
  }

  #right img {
    width: 100%;
  }

  #left p:first-child {
    margin-top: 0;
  }

  h2 {
    margin: 10px 0 20px;
    padding: 0;
  }

  p span {
    font-weight: bold;
  }

</style>
