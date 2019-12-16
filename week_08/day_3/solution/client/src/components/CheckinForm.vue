<template lang="html">
	<form v-on:submit.prevent="handleSubmit">
		<h1>Add a guest</h1>
		<label for="name">Name:</label>
		<input type="text" id="name" name="name" v-model="name" />

		<label for="email">Email:</label>
		<input type="email" id="email" name="email" v-model="email" />

		<label for="checked_in">Checked In:</label>
		<input type="checkbox" id="checked_in" name="checked_in" v-model="checked_in">

		<input type="submit" name="submit" value="Save" />
	</form>
</template>

<script>
import { eventBus } from '@/main';

export default {
	name: 'checkin-form',
	data(){
		return {
			"name": "",
			"email": "",
			"checked_in": false
		};
	},
	methods: {
		handleSubmit(){
			fetch("http://localhost:3000/api/bookings/", {
				method: "POST",
				body: JSON.stringify(this.$data),
				headers: {
					'Content-Type': 'application/json'
				}
			})
			.then(res => res.json())
			.then(booking => {
				eventBus.$emit('new-guest', booking);
				this.name = this.email = "";
				this.checked_in = false;
			});
		}
	}
}
</script>

<style lang="css" scoped>
	form {
		font-size: 16px;
	}

	input[type="text"], input[type="email"] {
		padding: 7px;
		margin: 0 10px;
	}

	input[type="submit"] {
		background: lightblue;
		border-radius: 0;
		border: none;
		font-size: 16px;
		color: #333;
		padding: 5px 10px;
		display: block;
		margin-top: 20px;
		cursor: pointer;
	}
</style>
