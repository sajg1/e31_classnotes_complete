import Vue from 'vue';
import Router from 'vue-router';
import SingleDateView from '@/views/SingleDateView';
import MultipleDateView from '@/views/MultipleDateView'

Vue.use(Router)

const router = new Router({
  routes: [
    {
      path: '/',
      name: 'single-date',
      component: SingleDateView
    },
    {
      path: '/dateRange',
      name: 'multiple-dates',
      component: MultipleDateView
    }

  ]
})

export default router;
