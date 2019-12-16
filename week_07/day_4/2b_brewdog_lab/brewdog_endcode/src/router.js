import Vue from 'vue';
import Router from 'vue-router';
import BeersView from '@/views/BeersView';
import FavouritesView from '@/views/FavouritesView';

Vue.use(Router)

const router = new Router({
  routes: [
    {
      path: '/beers',
      name: 'beers-view',
      component: BeersView
    },
    {
      path: '/favourites',
      name: 'favourites-view',
      component: FavouritesView
    }
  ]
})

export default router;
