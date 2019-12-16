# React Hooks - useEffect

**Lesson Duration: 45 minutes**

### Learning Objectives
- Understand how to use 'useEffect'

## Intro

The introduction of hooks in React has seen a move towards working primarily with functional components instead of classes.

This change means that our components no longer have access to the lifecycle methods such as `componentDidMount` and `componentDidUpdate` which we had access to when our classes extended `React.Component`. These methods performed side effects on the components and with that in mind the `useEffect` hook was created.

The `useEffect` hook is called by passing it a function in which you can perform your side effects.

## useEffect

To see this in action we're going to make a fetch request to an end point that is going to bring us back mock post data.

```bash
npx create-react-app posts
```

Open the app in atom and we'll start off by completely removing everything from `App.js` and then setting it up as a functional component.

We'll also import `useState` and `useEffect` from React.

```js
//App.js
import React, { useState, useEffect } from 'react';

export default function App(){

  return (
    <h1>App </h1>
  );
}
```

Lets set ourself some initial state.  We're going to be fetching an object, so we'll call the `useState` hook passing in an empty object as its initial value.

We can then destructure the result of that function into separate values - the current state and the function to update the current state.

```js
export default function App(){

  const [post, setPost] = useState({}) //NEW

  return (
    <h1>App </h1>
  );
}
```

We're now going to call the `useEffect` hook to make our api call and set this post as the result of the call.

Lets make a `getPost` function to make a call to http://jsonplaceholder.typicode.com/posts/1

```js
const [post, setPost] = useState({})

const getPost = () => { //NEW
  fetch(`http://jsonplaceholder.typicode.com/posts/1`)
  .then(res => res.json())
  .then(res => setPost(res))
}

return (
  <h1>App </h1>
);
}
```

And then call that function within the `useEffect` hook.  Remember `useEffect` is called by passing in a function.  In this function you would carry out any functionality which would affect your component - like updating state via an api call.

```js
export default function App(){

  const [post, setPost] = useState({})

  useEffect(() => { //NEW
    getPost()
  })

  const getPost = () => {
    fetch(`http://jsonplaceholder.typicode.com/posts/1`)
    .then(res => res.json())
    .then(res => setPost(res))
  }

  return (
    <h1>App </h1>
  );
}

```

The React dev tools in chrome aren't quite up to speed with the new changes so we can't expand our state object to see what lives in it.  But let's put trust in the process and return details about the post that we can see from the end point.

```js
export default function App(){

  const [post, setPost] = useState({})

  useEffect(() => {
    getPost()
  })

  const getPost = () => {
    fetch(`http://jsonplaceholder.typicode.com/posts/1`)
    .then(res => res.json())
    .then(res => setPost(res))
  }

  return ( //UPDATED
    <>
    <h2>{post.title}</h2>
    <p>{post.body}</p>
    </>
  );
}
```

### When Does useEffect get Called?

In the browser you should now be able to see the post rendering.  So far so good, or is it?

Let's stick a `console.log` in our get post function.

```js
const getPost = () => {
  console.log('fetching');
  fetch(`http://jsonplaceholder.typicode.com/posts/1`)
  .then(res => res.json())
  .then(res => setPost(res))
}
```

And then navigate back to the browser, open the console in your dev tools and have a look at the logging.  You should see that we have a constant loop of requests being made.  Why's this?

This is happening because `useEffect` is called every time there is an update.  So its updating the post, realises it has been updated, so runs again, realises its been updated.... and so on.

What if we want `useEffect` to run only when the component mounts?  That’s a common use case and `useEffect` takes a second parameter, an array of dependencies to handle this.  If you pass in an empty array, the effect function is run only on mount.  Lets do that.

```js
useEffect(() => {
  getPost()
}, [])
```

Great, now we should see 'fetching' logging out just once.

### componentDidUpdate mock

We've now set up `useEffect` so that it only runs when the component mounts by passing an empty array as the second argument.  This array can take values too, the values we pass in here will ensure `useEffect` runs every time they change.

Lets change our app so that the request takes in a dynamic id.  We'll add a button that when clicked updates this id which in turn will render us a new post.

> possible task

We need to:

- initiate some state which we'll call id.  Its initial value will be 1.
- update the fetch url so that it takes in this id rather than the hard coded 1.
- add a button that onClick calls a function to add 1 to the current id state value.

```js
export default function App(){

  const [post, setPost] = useState({})
  const [id, setId] = useState(1) //NEW

  useEffect(() => {
    getPost()
  }, [])

  const getPost = () => {
    console.log('fetching');
    fetch(`http://jsonplaceholder.typicode.com/posts/${id}`)  //UPDATED
    .then(res => res.json())
    .then(res => setPost(res))
  }


  return (
    <>
    <h2>{post.title}</h2>
    <p>{post.body}</p>
    <button onClick={() => setId(id + 1)}>Next Post</button> //NEW
    </>
  );
}
```

Navigate to your React dev tools in the browser.  You should see that the state with the initial value of 1 updates every time you click on the button, however its not performing a fetch request in relation to this.

We need to update the `useEffect` hook to tell it we want it to be called when the id state is updated.

```js
useEffect(() => {
  getPost()
}, [id])  //UPDATED
```

Now when we click on the next post button the fetch request is called with the new id.

## Benefits of useEffect

With `useEffect` our logic is more concise.  Whilst `useEffect` isn't the exact same as React's lifecycle methods it performs the same sort of functionality. In our example `useEffect` is performing the task of `componentDidMount` and `componentDidUpdate`.  Prior to hooks the logic of an effect ended up being spread out throughout the different lifecycle methods.

### Cleanup Method

We can also pass a cleanup method to our `useEffect` function. You can think of this being like `componentWillUnmount` which is called right before React unmounts and destroys our component. Use cases for `componentWillUnmount` include cancelling active network requests, stopping timers and removing active event listeners you added in `componentDidMount` in order to prevent memory leaks.  

Lets have a look at this in action. We'll initiate some state that uses the window api to listen out for the size of the screen.

```js
//App.js
const [post, setPost] = useState({})
const [id, setId] = useState(1)
const [windowSize, setWindowSize] = useState(window.innerWidth) //NEW
```

And then display information on the window size within render.

```js
//App.js
return (
  <>
  <h2>{post.title}</h2>
  <p>{post.body}</p>
  <button onClick={() => setId(id + 1)}>Next Post</button>

  <p>{windowSize < 420 ? 'phone' : 'desktop'}</p> //NEW
  </>
);
```

If the window size is less than 420 pixels it will display `phone`, otherwise `desktop`.

Lets now add an event listener within `useEffect` to listen out for the window resizing and then pass this listener a callback that sets our `windowSize` state to the new `window.innerWidth` size.

```js
useEffect(() => {
  getPost()
  window.addEventListener('resize', handleWindowResize)

}, [id])

const handleWindowResize = () => {
  setWindowSize(window.innerWidth)
}
```

Now if you resize your screen, or use the chrome device toolbar you should see the message change to `phone` when the window width is less than 420 pixels.

That's fine, but as mentioned before its good practice to remove event listeners before a component unmounts to prevent memory leaks.

`useEffect` can optionally return a function (the cleanup function) that React will call prior to the component being unmounted.  Its within this function we'll remove the event listener.

```js
useEffect(() => {
  getPost()
  window.addEventListener('resize', handleWindowResize)

  return () => window.removeEventListener('resize', handleWindowResize); //NEW

}, [id])
```

## Recap

Why when creating our components in this way can we not use Reacts lifecycle methods?

<details>

<summary>Answer</summary>

- Because we're not extending React.Component which gives us access to them.

</details>

<br/>

What React hook is used to call functions that have an effect on our component.

<details>

<summary>Answer</summary>

- useEffect

</details>

<br/>

What arguments does the `useEffect` hook call take?

<details>

<summary>Answer</summary>

- an anonymous function
- an optional argument of an array which can be empty or contain state values.  If it is empty `useEffect` will only be called on mount.  If it contains values it will be called every time these values change.

</details>


## Conclusion

In this lesson we've seen how we can use the `useEffect` hook from React to call on functions that will effect our component in some way.  We've seen the caveat of using `useEffect` in that it will be called every time something in the component is updated and the work around to avoid this happening when we don't want it to.

We've also seen how to perform cleanup functions on our component in order to prevent memory leaks.
