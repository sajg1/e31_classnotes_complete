<template lang="html">
  <nav>
    <router-link :to="{ name: 'single-date'}">Last Half Hour</router-link>  |
    <router-link :to="{ name: 'multiple-dates'}">Custom Date Range</router-link> 
  </nav>
</template>

<script>
export default {
}
</script>

<style lang="css" scoped>
</style>
