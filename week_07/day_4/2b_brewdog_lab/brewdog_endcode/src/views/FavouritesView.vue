<template lang="html">
  <div>
    <vuedog-header title="Favourite Beers"></vuedog-header>
    <vuedog-no-favourites v-if="noFavourites"></vuedog-no-favourites>
    <div class="favourites-view" v-if="favourites.length">
      <vuedog-beer-list :beers="favourites" :favIDs='favIDs'></vuedog-beer-list>
      <vuedog-beer-info v-show="selectedBeer" :beer="selectedBeer"></vuedog-beer-info>
    </div>
  </div>
</template>

<script>
import { eventBus } from '@/main.js'
import VuedogBeerList from '@/components/VuedogBeerList'
import VuedogBeerInfo from '@/components/VuedogBeerInfo'
import VuedogHeader from '@/components/VuedogHeader'
import VuedogNoFavourites from '@/components/VuedogNoFavourites'


export default {
  props: ['favourites', 'favIDs'],
  data(){
    return {
      selectedBeer: null
    }
  },
  computed: {
    noFavourites: function(){
      return this.favourites.length === 0
    }
  },
  components: {
    "vuedog-beer-info": VuedogBeerInfo,
    "vuedog-beer-list": VuedogBeerList,
    "vuedog-no-favourites": VuedogNoFavourites,
    "vuedog-header": VuedogHeader
  },
  mounted(){
    eventBus.$on('beer-selected', beer => this.selectedBeer = beer)
  }
}
</script>

<style lang="css" scoped>

  .favourites-view {
    display: flex;
    flex-wrap: wrap;
  }

</style>
