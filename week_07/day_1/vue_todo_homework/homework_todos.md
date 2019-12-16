# Homework: ToDo List

## Learning Objectives

- Be able to set up a basic Vue application
- Be able to use forms with `v-model`
- Be able to use `v-on` to manage user events

## Brief

Your task is to create a todo list application that allows a user to save an item to a list which then renders on the page.

Use Vue and Webpack to build a solution that looks like this:

![ToDos App](./images/todos.png)

## MVP

- Render a list of todos from an array of strings.  
- Add the capability to add a new todo to the list.

Your todos array would look something like:
```js
todos: [
	"Buy shopping", "Clean bathroom", "Car's MOT"
]
```

## Extensions

- Update the todos array to take in objects with keys of name and priority.
- Add radio buttons to track the level of priority
- Give the user visual feedback on what todos are high priority

## Setup

Your folder structure might look like this:

- public
	- css
	- js
	- index.html
- src
	- app.js
- .gitignore
- package.json
- webpack.config.js

For your convenience, here is a sample webpack configuration:

```js
const config = {
  entry: `${__dirname}/src/app.js`,
  output: {
    path: `${__dirname}/public/js/`,
    filename: 'bundle.js'
  },
	resolve: {
    alias: {
      'vue$': 'vue/dist/vue.esm.js'
    },
    extensions: ['*', '.js', '.vue', '.json']
  },
  mode: 'development'
};

module.exports = config;
```
