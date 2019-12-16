<template lang="html">
  <nav>
    <router-link :to="{ name: 'beers-view'}">Beers</router-link>
    <router-link :to="{ name: 'favourites-view'}">Favourites</router-link>
  </nav>
</template>

<script>
export default {
}
</script>

<style lang="css" scoped>

nav {
  align-content: center;
  display: flex;
  margin-left: 40%;
  margin-right: 40%;
}

a {
  padding-top: 40px;
  padding-left: 20px;
  padding-right: 20px;
  font: bold 20px Futura;
}
</style>
