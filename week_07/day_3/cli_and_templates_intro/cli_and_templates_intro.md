# Vue CLI and Templates Introduction

**Lesson Duration: 30mins**

### Learning Objectives

- Understand how to use the Vue CLI to create a boilerplate app template
- Understand how to create a Vue Component

## Intro

Up until now we have been building our Vue apps with a relatively simple folder structure. What if we wanted to make more complex apps, however?  As we know, Vue is pretty unopinionated and we can build our Vue apps in various ways.

What if we wanted to integrate a testing framework or use a pre-processor like SASS or even write in TypeScript?  We'd really have to think about our folder structure and all of the dependencies that we require.

Luckily for us, Vue comes with a Command Line Interface which is the standard build tool for Vue applications which aims to reduce the amount of configuration the developer has to go through.

You can read a lot more in depth about this [here](https://cli.vuejs.org/), but essentially the CLI allows us to set up our projects with a number of configuration options. We can save our chosen configuration as a preset, so that we can quickly roll a new app whenever we need to.

## Hello World

Let's build a simple Hello World app to see exactly what this build gives us.

First we have to globally install the `Vue CLI` so that we can create our boilerplate builds from anywhere on our computers.

```bash
npm install -g @vue/cli
```

This gives us the `vue` terminal command. Let's check it's working, by seeing the help that's available for the Vue CLI.

```
vue -h
```

Let's create our app.

```bash
vue create hello_world
```

At this point, we should be asked to choose what features we want to use, in the form of a preset. We're going to create our own.

**Use the arrow keys to select "Manually select features", then press return.**

We can now use the arrow keys and the space bar to choose the features we want to use.

**Make sure that Babel is the only option selected, then press return.**

We're then asked to choose where we want to store various pieces of configuration.

**Choose "In dedicated config files", then press return.**

We're then asked whether to save our settings as a preset.

**Type "y", then return.**

Next, we're asked what the name of the preset will be.

**Type "CodeClan" without the quotes, then press return.**


At this point, NPM will install our chosen dependencies. Once it's finished, do as the CLI suggests:

```bash
cd hello_world
npm run serve
```

You can then open a browser window at `http://localhost:8080` to see your app. Next time, we won't have to choose a preset, just use the CodeClan one that we've created.

In future you will likely wish to set your own manual configuration, however this is the most basic build we require for the time being.

Open a new tab in your terminal, and open up the project in Atom. You'll see a few new files.

### How is this working?

Navigate into the `src` folder and open `main.js`.  This is where the app is being kicked off from.  The only thing that's new here is the `render` function:

```js
//main.js
new Vue({
  render: h => h(App),
}).$mount('#app')

```

A new Vue instance has been created and is being placed in the root element of `#app`.  The render function is rendering our app within the `#app` div.

>The following is for information only.  Don't live code this unless the class queries it in depth.

Now the confusing bit. `render: h => h(App)`.  This is just shorthand for:

```js
//main.js
new Vue({
  render: function(createElement) {  //MODIFIED
    return createElement(App);
  }
}).$mount('#app')
```

Which can be shortened to

```js
//main.js
new Vue({
  render (createElement) {  //MODIFIED
      return createElement(App);
  }
}).$mount('#app')
```

Which can also be shortened to

```js
//main.js
new Vue({
  render (h) {  //MODIFIED
      return h(App);
  }
}).$mount('#app')
```

> Why h?  h is the common convention alias for createElement in the Vue ecosystem.  
Why?  It comes from the term "hyperscript", which is commonly used in many virtual-dom implementations. "Hyperscript" itself stands for "script that generates HTML structures" because HTML is the acronym for "hyper-text markup language".

Which is then shortened further using es6 fat arrow syntax to

```js
//main.js
new Vue({
  render: h => h(App)  //MODIFIED
}).$mount('#app')
```

You'll notice we are also missing our `DOMContentLoaded` function.  This is a little bit of framework magic where the `$mount` function is attaching our Vue instance to the DOM in the `#app` element.

## Component Structure

Next, let's look at the `App` component which is being rendered.  You'll notice that the file type is a `.vue` file rather than a `.js` file.  It is the `vue-template-compiler` dependency which is converting this back into a plain JavaScript module.

There are three main parts of each `.vue` file.

We have the `template` which is where we'll manage our component's HTML.

Within the `script` tags we will have all of our JavaScript functionality.  

Between the `style` tag is where we'll write any css relevant to this component.

### What is a component?

We can think of components as building block of our application. Components are single, independent units of an interface. They can have their own state, layout and style.  Building our apps with components allows us to ensure that we have individual modules of code that have sole responsibility for their aspects of the apps functionality.

### Writing our own components

Now we know how the component structure works, let's write our own.

We'll start off by deleting everything from `App.vue`.  Before we write our own template/script/style structure lets install a very helpful atom package called `language-vue`.  This package gives us a shortcut to creating this structure.  We'll also install `language-babel` which gives us nice syntax highlighting.

```bash
apm install language-vue
apm install language-babel
```

> For this to take effect atom will have to be restarted.

Now when we are in a `.vue` file, when we type `template` you should see the `Vue Component` suggestion.  Selecting this will give us the boilerplate setup of a Vue component.

One thing to point out here other than the language attributes in template and style is that the style is `scoped`.  This means that for that component you can target any DOM element and it will only style that element within that component.

For example, if we write a piece of CSS like this:

```css
h3 {
  color: red
}
```

This will only affect any `h3` elements within this component - not the rest of the app! Be careful about this - ensure you organise your CSS properly.

Now, we can see that each component contains its own template (HTML), behaviour (JavaScript), and styling (CSS).

### Rendering Data

Let's give this component some state via the data object, within the object that we're exporting from our script tags.  We also need to give it the name of the component.

```js
// App.vue
<script>
export default {
  name: 'app',
  data(){  //NEW
    return {
      message: 'Hello World'
    }
  }
}
</script>
```

Notice that the structure of our `data` variable has changed slightly - `data` here is a function that returns an object `{}`. By returning an object from our data function it ensures that any change made to the data remains local to that instance of the component. Note that this has changed slightly from the way we wrote our apps when we were working within a single component. We can have any keys and values we like here, as before.

Let's then render that data within the template.

```html
<!-- App.vue -->
<template lang="html">
  <p>{{ message }}</p>
</template>
```

The browser will refresh on save, so save your file and navigate back to the browser.  You should now see hello world displayed.

## Recap

How do we start a new Vue app using the CLI?
<details>
<summary>Answer:</summary>

`vue create my_app_name`

</details>
<br />
What is a "preset"?

<details>
<summary>Answer:</summary>

A preset is a collection of settings that allows us to set up a Vue application in our preferred way.

</details>

## Conclusion

We saw that we can use the Vue CLI to quickly create applications with various settings.
