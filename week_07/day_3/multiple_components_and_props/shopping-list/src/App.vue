<template lang="html">
  <div class="">
    <h1>My Shopping List</h1>
    <ul>
      <shopping-item v-for="(item, index) in items" :key="index" :item="item">
      </shopping-item>
    </ul>
  </div>
</template>

<script>
import ShoppingItem from './components/ShoppingItem.vue';

export default {
  name: 'app',
  data() {
    return {
      items: [
        {name: 'Olive Oil', purchased: false},
        {name: 'Chipotle Paste', purchased: true},
        {name: 'Notebook', purchased: false}
      ]
    };
  },
  components: {
    'shopping-item': ShoppingItem
  }
}
</script>

<style lang="css" scoped>
</style>
