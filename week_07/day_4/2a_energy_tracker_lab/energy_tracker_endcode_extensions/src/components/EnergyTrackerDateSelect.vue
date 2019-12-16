<template lang="html">
  <section>
    <p>Please enter a date range:</p>
    <label for="from">From:</label>
    <input id="from" type="datetime-local" :max="dates.to" v-model="dates.from"/>
    <label for="to">To:</label>
    <input id="to" type="datetime-local" :min="dates.from" v-model="dates.to"/>
    <button v-if="dates.to && dates.from" v-on:click="emitDates">Search Dates</button>
  </section>
</template>

<script>
import { eventBus } from '@/main.js'

export default {
  data(){
    return {
      dates: {
        to: null,
        from: null
      }
    }
  },
  methods: {
    emitDates: function(){
      eventBus.$emit('dates-selected', this.dates)
    }
  }
}
</script>

<style lang="css" scoped>
label {
  padding: 20px;
}
</style>
