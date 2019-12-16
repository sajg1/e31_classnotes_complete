<template lang="html">
	<section>
		<h2>Guest List</h2>
		<div id="guests-wrapper">
			<guest-info v-for="(guest, index) in guests" :key="index" :guest="guest" />
		</div>
	</section>
</template>

<script>
import GuestInfo from "@/components/GuestInfo";
import { eventBus } from '@/main';
import BookingService from "@/services/BookingService";

export default {
	name: 'guest-list',
	data: function(){
		return {
			guests: []
		};
	},
	mounted(){
		eventBus.$on('new-guest', (guest) => {
			this.guests.push(guest);
		});

		eventBus.$on('guest-deleted', (id) => {
			const index = this.guests.findIndex(guest => guest._id === id);
			this.guests.splice(index, 1);
		});

		BookingService.getBookings()
		.then(guests => this.guests = guests);
	},
	components: {
		'guest-info': GuestInfo
	}
}
</script>

<style lang="css" scoped>
section {
	margin-top: 40px;
}
#guests-wrapper {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-around;
}
</style>
