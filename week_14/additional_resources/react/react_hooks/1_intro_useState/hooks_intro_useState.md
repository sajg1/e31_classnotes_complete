# Intro to React Hooks - PiggyBank

**Lesson Duration: 45 minutes**

### Learning Objectives
- Understand what React Hooks are
- Understand how to use 'useState'


## Intro

The introduction of React hooks has given us a new tool to add to our tool box - a new design pattern we can use.

React hooks are functions that allow us to hook into the React state and lifecycle features from functional components. In total [10 hooks]('https://reactjs.org/docs/hooks-reference.html') were introduced, some will be a lot more commonly used than others.

The hook `useState` that we are going to cover in this lesson allows us to inititalise and update local state in functional components, allowing us to make our component code much more concise. Prior to hooks you were unable to use local state in a functional component, if you wanted to use state you'd have to define a class and give it a constructor. This is no longer the case.

## useState
We're going to make a simple PiggyBank application to see `useState` in effect.

```bash
npx create-react-app piggy_bank_hooks
```

Open the app in atom and we'll start off by completely removing everything from `App.js` and then setting it up as a functional component.

```js
//App.js

import React from 'react';

export default function App(){

  return (
    <h1>App</h1>
  );
}
```

Now lets make our `PiggyBank` component.

```bash
touch src/PiggyBank.js
```

In here we'll also set this up as a functional component.

```js
//PiggyBank.js
import React from 'react';

export default function PiggyBank(){

  return (
    <p>PiggyBank</p>
  );
}
```

And then import and use this in `App.js`.

```js
//App.js
import React from 'react';
import PiggyBank from './PiggyBank'; //NEW

export default function App(){

  return (
    <PiggyBank /> //NEW
  );
}
```

Lets give our `PiggyBank` some state by using the `useState` hook. We have to import this from React.

```js
//PiggyBank.js
import React, { useState } from 'react'; //UPDATED

export default function PiggyBank(){

  return (
    <p>PiggyBank</p>
  );
}
```

Hooks are just functions, so we can use `useState` by invoking it. It is called with one argument and that argument is the initial state value. In this case we're going to be tracking the total amount that's in a piggy bank so the initial state here will be 0.

```js
//PiggyBank.js
export default function PiggyBank(){

  useState(0) //NEW

  return (
    <p>PiggyBank</p>
  );
}
```

Invoking this function returns an array with two values. The first value is the current state being tracked and the second is a function to update the state value. We can destructure this in to separate values.  We can call these whatever we want; but it makes sense to call the function set<StateName>. For this example it will be `setTotal`.

```js
//PiggyBank.js
export default function PiggyBank(){

  const [total, setTotal] = useState(0) //UPDATED

  return (
    <p>PiggyBank</p>
  );
}
```

And then we can call on them within the function.

```js
//PiggyBank.js
export default function PiggyBank(){

  const [total, setTotal] = useState(0)

  return (
    <p>Total: £{total}</p> //UPDATED
  );
}
```

Lets write a function to deposit money into the account. In this function we'll be using our `setTotal` function to update state.

```js
//PiggyBank.js
export default function PiggyBank(){

  const [total, setTotal] = useState(0)

  const deposit = (value) => { //NEW
    setTotal(total + value)
  }

  return (
    <p>Total: £{total}</p>
  );
}
```

Notice how we don't have to worry about `prevState` here we just call the `setTotal` function passing in the current state (`total`) as the first argument and the amount to add to it as the second.

We also don't have to worry about binding the context of `this` as we are not working with classes anymore. In classes, it was important to bind `this` because we want to ensure that the `this` in the callbacks referred to the component's instance itself.  The function that is returned as the second argument from invoking `useState` is already bound to the current component.

Lets now set up a button to call on this function. We'll have to wrap our elements in one root element to ensure we're only returning one element from render so we'll use `React Fragments`.

```js
//PiggyBank.js
export default function PiggyBank(){

  const [total, setTotal] = useState(0)

  const deposit = (value) => {
    setTotal(total + value)
  }

  return (
    <>
    <p>Total: £{total}</p>
    <button onClick={() => deposit(5)}>Deposit</button>
    </>
  );
}
```

### Multiple useState

If you were to have multiple state values in the component you would just deconstruct the return values of a `useState` with relevant names.

>Ask class to not code along - example only

```js
const [total, setTotal] = useState(0)
const [accounts, setAccounts] = useState([])
```

Here the initial state of accounts is an empty array.

## Props

Something that's not changed with hooks is the use of props. We can still pass props down to use in our components. Lets give the `PiggyBank` a props of title and then render it in the component.

```js
//App.js

export default function App(){

  return (
    <PiggyBank title="Louise's PiggyBank"/> //UPDATED
  );
}

```

```js
//PiggyBank.js

export default function PiggyBank({ title }){ //UPDATED

  const [total, setTotal] = useState(0)

  const deposit = (value) => {
    setTotal(total + value)
  }

  return (
    <>
    <h1>{title}</h1> //NEW
    <p>Total: £{total}</p>
    <button onClick={() => deposit(5)}>Deposit</button>
    </>
  );
}

```

### Task: 10 minutes

Add a withdraw function that takes in an amount to withdraw.  Use the function from `useState` to update the current state. If the current state minus the amount is less than 0 set the current state to be 0.

Solution:

```js
//PiggyBank.js

const withdraw = (value) => { //NEW
  if(total - value < 0){
    setTotal(0)
  } else {
    setTotal(total - value)
  }
}

return (
  <>
  <h1>{title}</h1>
  <p>Total: £{total}</p>
  <button onClick={() => deposit(5)}>Deposit</button>
  <button onClick={() => withdraw(3)}>Withdraw</button> //NEW
  </>
)

```


## Recap

What are React hooks?

<details>

<summary>Answer</summary>

- JavaScript functions

</details>

<br/>

With react hooks do we need to declare a class component to use local state?

<details>

<summary>Answer</summary>

- No.  State can be used in functional components.

</details>

<br/>

What hook do we use if we want local state within the component?

<details>

<summary>Answer</summary>

- useState

</details>

<br/>

What does the useState hook return?

<details>

<summary>Answer</summary>

- An array with two values.  The first value is the current state and the second is a function used to update the state.

</details>



## Conclusion

In this lesson we've seen how we can use the `useState` hook from React to give local state to functional components.
