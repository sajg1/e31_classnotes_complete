<template lang="html">
	<div class="guest-info">
		<h3>{{ guest.name }}</h3>
		<p>{{ guest.email }}</p>
		<p>
			<label for="checked_in">Checked In:</label>
			<input
			v-on:change="setCheckedIn"
			type="checkbox"
			name="checked_in"
			v-model="guest.checked_in" />
		</p>
		<button v-on:click="deleteCustomer">Delete This Customer</button>
	</div>

</template>

<script>
import { eventBus } from '@/main';
import BookingService from "@/services/BookingService";

export default {
	name: 'guest-info',
	props: ["guest"],
	methods: {
		setCheckedIn: function(){
			BookingService.updateBooking(this.guest)
		},
		deleteCustomer: function(){
			BookingService.deleteBooking(this.guest._id)
			eventBus.$emit('guest-deleted', this.guest._id);
		}
	}
}
</script>

<style lang="css" scoped>
.guest-info {
	box-sizing: border-box;
	width: 32%;
	background: lightblue;
	margin-bottom: 20px;
	padding: 20px;
}

h3 {
	margin-top: 0;
}
</style>
