<template>
  <div id="app">
    <h1>Energy Tracker</h1>
    <energy-tracker-nav></energy-tracker-nav>
    <router-view></router-view>
    <energy-tracker-chart-select></energy-tracker-chart-select>
  </div>
</template>

<script>
import EnergyTrackerChartSelect from '@/components/EnergyTrackerChartSelect'
import EnergyTrackerNav from '@/components/EnergyTrackerNav'

export default {
  name: 'app',
  components: {
    'energy-tracker-nav': EnergyTrackerNav,
    'energy-tracker-chart-select': EnergyTrackerChartSelect
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
