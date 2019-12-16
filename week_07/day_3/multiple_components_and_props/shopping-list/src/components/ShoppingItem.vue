<template lang="html">
  <div class="">
    <p v-bind:class="{'purchased': item.purchased}">{{ item.name }}</p>
    <button v-if="!item.purchased" v-on:click="purchase">Purchase</button>
  </div>
</template>

<script>
export default {
  name: 'shopping-item',
  props: ['item'],
  methods: {
    purchase(){
      this.item.purchased = true;
    }
  }
}
</script>

<style lang="css" scoped>
p {
  background-color: wheat;
}

.purchased {
  background-color: salmon;
  text-decoration: line-through;
}
</style>
