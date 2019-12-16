<template>
  <div id="app">
    <vuedog-navbar/>
    <vuedog-header title = "VueDog"/>
    <vuedog-header v-if="!beers.length" title="LOADING..."/>
    <router-view :beers="beers" :favourites="favourites" :favIDs="favouriteIDs" id="view"/>
  </div>
</template>

<script>
import {eventBus} from '@/main'
import VuedogHeader from '@/components/VuedogHeader'
import VuedogNavBar from '@/components/VuedogNavBar'

export default {
  name: 'app',
  components: {
    'vuedog-header': VuedogHeader,
    'vuedog-navbar': VuedogNavBar
  },
  data(){
    return  {
      beers: [],
      favouriteIDs: []
    }
  },
  computed: {
    favourites: function(){
      return this.favouriteIDs.map(id => this.beers.find(beer => beer.id === id))
    }
  },
  methods: {

    getBeers: function(){
      const promises = [1,2,3,4,5].map(num => {
        return fetch(`https://api.punkapi.com/v2/beers?page=${num}&per_page=80`)
        .then(res => res.json())
      })

      Promise.all(promises)
      .then(data => this.beers = data.reduce((flat, toFlatten) => flat.concat(toFlatten), []))
      .then(()=> this.sortBeers("name"));
    },

    sortBeers: function(property){
      this.beers.sort((a, b) => {
        return a[property] < b[property] ? -1 : 1
      })
    },

    addFavourite: function(id){
      this.favouriteIDs.push(id)
    },

    removeFavourite: function(id){
      const index = this.favouriteIDs.indexOf(id)
      this.favouriteIDs.splice(index, 1)
    }
  },
  mounted(){

    this.getBeers()

    eventBus.$on('favourite-added', id => this.addFavourite(id))

    eventBus.$on('favourite-removed', id => this.removeFavourite(id))
  }
}
</script>

<style lang="css" scoped>
#app {
  background-color: #6EC3F4;
}

</style>
