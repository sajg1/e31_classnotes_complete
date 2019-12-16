<template lang="html">
  <span>
    <h2 v-if="!multiDates">Generation Mix for the GB power system for {{from | fullDate}} to {{to | hoursMinutes}}</h2>
    <h2 v-if="multiDates">Generation Mix for the GB power system for {{from | fullDate}} to {{to | fullDate}}</h2>
  </span>
</template>

<script>
export default {
  name: 'energy-tracker-header',
  props: ['from', 'to', 'multiDates'],
  filters: {
    fullDate: function(dateString){
      return new Date(dateString).toLocaleString()
    },
    hoursMinutes: function(dateString){
      const date = new Date(dateString)
      return `${date.getHours()}:${date.getMinutes()}`
    }
  }
}
</script>

<style lang="css" scoped>
</style>
