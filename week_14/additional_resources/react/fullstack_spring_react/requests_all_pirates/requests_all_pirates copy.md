# React Requests - Pirate API

## Learning Objectives

- Understand how to make a call to our Pirate API using React.
- Understand how to write custom routes to get back the data we want.


## Duration
1 hour 30 minutes

# Intro

You all wrote awesome applications using the countries RESTful API in vanilla JS. In this lesson we are going to use React to make a HTTP request to our own Pirate API. As we saw with the Comments app, by setting the received data on our state, we trigger a re-render of our application, which we can use to populate our UI. Here we will see how React's component lifecycle methods can help us perform HTTP requests. We will also be using stateless functional components where possible.

# Rest APIs using HAETOS

Do you remember what Spring Data Rest gave us? It gave us HAETOS route that adhered to the 7 restful routes. The good news is that we can easily use these routes to connect to our own API.

If you haven't already, go and grab the JSON formatter extension for Chrome:

https://chrome.google.com/webstore/detail/json-formatter/bcjindcccaagfpapjjmafapmmgkkhgoa?hl=en

This will make it a lot easier to read our JSON results.

Let's have a look at the api we are going to use today - the PirateService api.

> Hand out start point and have students open back-end in IntelliJ.

As you can see this back end is the same as we created last week with projections set for all 3 models to get back all the data associated with each.


### Task
Run the back-end application in IntelliJ.
Visit the HAETOS restful routes in your browser and look at the data.

So today we will be using 2 different types of URL in our apps.

We will be using `/pirates` in React to get back our list of pirates but also `/pirates` to hit our API

SO React will use http://localhost:3000/pirates and Spring will use http://localhost:8080/pirates to hit the API. Yuck! This could get really really confusing. So let's make it clearer by changing the base route for Spring so that we need to hit `/api/pirates` to get back the data from Spring.

In the Java code open application.properties and add the following line.

```xml
<!-- application.properties -->

spring.data.rest.basePath=/api
```

Now visit the browser and go to http://localhost:8080/api/pirates.

Great we now have our data back on this route so we will use that moving forward for whatever data we want. So if we wanted all ships it would be `/api/ships` etc...

So the main route we are going to use today is this one

http://localhost:8080/api/pirates

This gives us ALL the pirate data.

Let's have a go.

## React request

> Have students open front end code and look at it in atom. Note that we have a navbar, route and css included.

Here we have a React application set up to give us a route to `/pirates`. This triggers a render of a `PirateContainer`. It is in here that we will make the request to the API to get back all of the data.

As we will be making multiple requests to get data we can abstract out the method to a helper. Just like we did in Vanilla JS.

```bash
mkdir src/helpers
touch src/helpers/request.js
```

Next we will write a get function in request.js that will take in a url and fetch the data. This will then return us the JSON data fromn our API. Exactly like we did before.

```js
//request.js

class Request {

  get(url) {
    return fetch(url)
    .then((res) => res.json());
  }
}

export default Request;
```

Lastly we will import this into our PirateContainer to use.

```js
//PirateContainer.js

import React, {Component} from 'react';
import PirateList from '../../components/pirates/PirateList.js';

import Request from '../../helpers/request.js'; // ADDEED

```

Now in our PirateContainer we will fetch the data in `componentDidMount` and we will log out the data we get back initially.

```js
//PirateContainer.js

componentDidMount(){
    let request = new Request()
    request.get('/api/pirates').then((data) => {
      console.log(data);
    })
  } // NEW
```

## Proxy

When we do this React is actually sending a request to `localhost:3000/api/pirates`.

We don't want this... we want to hit `localhost:8080/api/pirates`.

We could pass in the full url into the get but then this would give us CORS errors that we would need to deal with in our Spring app.

A better way around this is to assign a `proxy` value in our `package.json`

With the proxy any requests that are sent out of the application will use the proxy rather than reacts. So if we set the proxy to `http://localhost:8080/` any fetch request will use the Spring server.

So our fetch `/pirates` will actually resolve to `http://localhost:8080/api/pirates`.

```json
"browserslist": [
    ">0.2%",
    "not dead",
    "not ie <= 11",
    "not op_mini all"
  ],
  "proxy": "http://localhost:8080/" */ ADDED /*

```

> Note you may have to restart the server for this to take effect.

Cool so now we are able to get the data back.

Note that when the pirates come back, the array of pirates is wrapped in an `_embedded` tag so we will need to access that first.

```js
//PirateContainer.js
componentDidMount(){
    let request = new Request()
    request.get('/api/pirates').then((data) => {
      console.log(data._embedded); // AMENDED
    })
  } // NEW
```

OK so now we have an array of Pirates. We can then set the state to be this array.

```js
//PirateContainer.js

componentDidMount(){
    let request = new Request()
    request.get('/api/pirates').then((data) => {
      this.setState({pirates: data._embedded.pirates}) // NEW
    })
  }
```

Great so we now have an array of Pirates that we can pass to PirateList as props to start populating our list of pirates in the browser.

In `PirateContainer`'s render function remove the `div` and replace with PirateList element. We will pass the list of pirates from state into this as a prop.  

```js
//PirateContainer. js

render(){
  return (
    <PirateList pirates={this.state.pirates}/> // MODIFIED
  );
}
```

In PirateList we will now log out the props.pirates and make sure we have our data.

```js
//PirateList.js

console.log(props.pirates);
return (
  <div>Im a list of pirates!</div>
)
```

Cool we can now see the pirates array being logged out from within PirateList.

We will change the `div` and instead we will use a `ul` to display a list of Pirate components.


So first we want to create an li tag for each Pirate. To do this we want to loop over the array of pirates and return a collection of `li` tags with a `Pirate` component in each. We also want each individual `Pirate` object passed into them in turn.

We can use `Array.map` to achieve this.

```js
//PirateList.js

const pirates = props.pirates.map((pirate) => {
	 	return (<li key={pirate.id} className="component-item">
			<Pirate pirate={pirate} />
		</li>
	)
	})
```

Next we will change the div to a ul and render the `li` elements inside.

```js
//PirateList.js

return (
  <ul className="component-list">
    {pirates}
  </ul>
) // MODIFIED
```


Cool so we should now see a list of divs with `I am a pirate` displayed.

Lets change this to display the Pirates details

```js
//Pirate.js

return (
    <div className="component">
        <p className="name">
          {props.pirate.firstName} {props.pirate.lastName}
        </p>
      <p>Age: {props.pirate.age}</p>
      <p>Ship: {props.pirate.ship.name}</p>
    </div>
  )
```

Lets destructure this pirate a bit

```js
//Pirate.js

const { firstName, lastName, age, ship} = props.pirate


return (
    <div className="component">
        <p className="name">
          {firstName} {lastName}
        </p>
      <p>Age: {age}</p>
      <p>Ship: {ship.name}</p>
    </div>
  )
```

Fantastic we now have a list of pirates showing all their details.

# Summary
- Learned how to make a call to our Pirate API using React.

# Next Lesson
* **Lab** - Fetch all Ships and raids.
