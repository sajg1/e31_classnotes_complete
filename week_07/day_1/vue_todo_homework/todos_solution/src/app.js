import Vue from "vue";

window.addEventListener("DOMContentLoaded", () => {
  new Vue({
    el: "#app",
    data: {
      title: "ToDo's",
      todos: [
        {name: "Buy shopping", priority: "high"},
        {name: "Clean bathroom", priority: "low"},
        {name: "Car's MOT", priority: "high"}
      ],
      newTodo: {
        name: "",
        priority: null
      },
    },
    methods: {
      saveNewTodo: function(){
				this.todos.push(this.newTodo);
				this.newTodo = {
          name: "",
          priority: null
        };
			},
    }
  });
});
