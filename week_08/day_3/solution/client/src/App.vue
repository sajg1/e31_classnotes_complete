<template>
  <div id="app">
    <checkin-form/>
    <guest-list/>
  </div>
</template>

<script>
import CheckinForm from "@/components/CheckinForm";
import GuestList from "@/components/GuestList";

export default {
  name: 'app',
  components: {
    'checkin-form': CheckinForm,
    'guest-list': GuestList
  }
}
</script>

<style>
  body {
    background: #eee;
    font-family: 'Open Sans', sans-serif;
  }

  #app {
    width: 75%;
    margin: 0 auto;
    background: #fff;
    padding: 20px 40px 40px 40px;
  }
</style>
