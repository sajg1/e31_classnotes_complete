<template lang="html">
  <div id="no-favs">
    <h2>You have no favourite beers</h2>
    <p>Why not add some <router-link :to="{ name: 'beers-view' }">here?</router-link></p>
  </div>
</template>

<script>
export default {
  name: 'vuedog-no-favourites'
}
</script>

<style lang="css" scoped>

#no-favs {
  margin-left: 30%;
  margin-right: 30%;
  padding-bottom: 100%;
}

a {
  font: bold 11px Futura;
  text-decoration: none;
  background-color: #EEEEEE;
  color: #333333;
  padding: 2px 6px 2px 6px;
  border-top: 1px solid #CCCCCC;
  border-right: 1px solid #333333;
  border-bottom: 1px solid #333333;
  border-left: 1px solid #CCCCCC;
}

p, h2 {
  font-family: Futura;
}

</style>
