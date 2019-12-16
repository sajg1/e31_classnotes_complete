<template lang="html">
  <div class="beer-view" v-if="beers.length">
    <vuedog-beer-list :beers="beers" :favIDs='favIDs'></vuedog-beer-list>
    <vuedog-beer-info v-show="selectedBeer" :beer="selectedBeer"></vuedog-beer-info>
  </div>
</template>

<script>
import { eventBus } from '@/main.js'
import VuedogBeerList from '@/components/VuedogBeerList'
import VuedogBeerInfo from '@/components/VuedogBeerInfo'

export default {
  props: ['beers', 'favIDs'],
  data(){
    return {
      selectedBeer: null
    }
  },
  components: {
    "vuedog-beer-info": VuedogBeerInfo,
    "vuedog-beer-list": VuedogBeerList
  },
  mounted(){
    eventBus.$on('beer-selected', beer => this.selectedBeer = beer)
  }
}
</script>

<style lang="css" scoped>

.beer-view {
  display: flex;
  flex-wrap: wrap;
}

</style>
