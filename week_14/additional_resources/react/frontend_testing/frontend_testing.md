# Front-end Testing with Jest & Enzyme

**Lesson duration: 60mins (approx.)**

### Learning Objectives:
- Set up front end testing tools
- Use shallow rendering to test component structure
- Use snapshot testing to test design continuity
- Use full DOM rendering to test component functionality

## Introduction

Until now we've been using mocha to test our JavaScript programs. We follow the arrange-act-assert pattern to set up the thing we want to test, do something to it then check that what we expected to happen did actually happen. Our programs have grown in complexity since we first met mocha though, and now we've discovered a significant downside to it: without giving it some help we can only use it to test our back end!

Fortunately, help is at hand. The apps we create with create-react-app have a testing framework built in to them called *Jest*. Jest can do all of the things that mocha can do (so we can still use it for unit testing) but can also be used to mock up instances of our components which we can write tests for. By adding an extra tool called *Enzyme* we can test all aspects of our components, from structure through to functionality.

## Installation

>Give out start code

We're going to add some front end tests to our comment app from earlier in the week. Like any app created using `create-react-app`, we already have Jest installed and a script set up to run it using `npm test`. The extra tools we need can be installed using npm:

```sh
npm i -D enzyme enzyme-adapter-react-16 react-test-renderer
```

This installs enzyme and a package which enables us to use it with React, `enzyme-adapter-react-X`. Different versions are available for different versions of React, replace `X` with the major version number of your React dependency.  

Before we can use Enzyme we need to do a tiny bit of configuration. First, we need to create a file in our project's `src` director:

```sh
touch src/setupTests.js
```

In that file we set up an adapter to let us use Enzyme in our project:

```js
// setupTests.js
import {configure} from "enzyme";
import Adapter from "enzyme-adapter-react-16";

configure({adapter: new Adapter()});
```

And we're good to go! Wiring everything together and the rest of the setup is handle by `create-react-app`'s magic. 

## Shallow Rendering

Before we can test our components we need to render them. Enzyme can render components in different ways, depending on what we want to test them for. The first way is *shallow* rendering, which renders a "shallow copy" of the component. The HTML elements and any child components are rendered, but if the component has any children they are not rendered fully (meaning none of their children are rendered). If we only want to check that a child component is being rendered or that the layout is correct we should use shallow rendering. 

Let's start by checking that our CommentBox container is doing what it's supposed to. The naming convention for test files using Jest is ```componentName.test.js```.

```sh
touch src/containers/CommentBox.test.js
```

First, we need to import the components we need and Enzyme's shallow rendering function. We'll also add a `describe()` call to group our tests together:

```js
// CommentBox.test.js

import React from 'react';
import CommentBox from '../containers/CommentBox';
import CommentForm from '../components/CommentForm';
import CommentList from '../components/CommentList';
import { shallow } from 'enzyme';			

describe('CommentBox', () => {

});
```

Before we can do any testing we need to use that shallow rendering to create a component. Just like we did with mocha, we declare the variable we want to save our component in and use `beforeEach()` to do our set up:

```js
// CommentBox.test.js

//...
describe('CommentBox', () => {						

	let wrapper;												// NEW
	
	beforeEach(() => wrapper = shallow(<CommentBox />));		// NEW

});
```

Now we're ready to write a test! The first thing we'll check is that CommentBox does in fact render the HTML elements we expect it to. At this point we don't care about what's in them, only that they're there. Enzyme provides [a range of methods](https://airbnb.io/enzyme/) for us to use, including one called `find()`. As the name suggests, this searches for specific elements and returns an array containing any it finds. 

As well as Enzyme's new methods, we need to adjust to Jest's syntax, which is slightly different to what we've seen previously. Instead of mocha's `assert.equal(actual, expected)` Jest uses `expect(actual).toEqual(expected)` ([other assertions](https://jestjs.io/docs/en/expect) are also available). By plugging Enzyme's method into Jest's we can test that CommentBox is rendering the `div` which will contain the other elements. We use `find()` to search for the `div`, then check that the resulting array has a single element:

```js
describe('CommentBox', () => {

//...

  it("should render a <div>", () => {
    expect(wrapper.find("div").length).toEqual(1);
  });
  
}

```

Fire up jest using the `npm test` script. Note that once the test run is complete it doesn't shut down; the default test script from create-react-app starts jest in watcher mode, so our test suite is re-run every time we make changes to our files. We should see a passing test! Now that we've shown the `div` is rendering, let's check for the other HTML elements.

### Task (5 minutes):

Write a test to make sure CommentBox is rendering two `h2` elements.

<details>
<summary>Solution</summary>

```js
// CommentBox.test.js

  it("should render two <h2>s", () => {
    expect(wrapper.find("h2").length).toEqual(2);
  });

```
</details>

We can do more than simply check for HTML though, we can check for entire components being rendered. Another of Enzyme's methods is `containsMatchingElement()`, which returns a boolean if the desired element is found. We can use it to make sure CommentBox is rendering a CommentForm:

```js
// CommentBox.test.js

  it("should render a CommentForm", () => {
    expect(wrapper.containsMatchingElement(<CommentForm />)).toEqual(true);
  });

```

Just like before we don't care what's going on inside CommentForm, only that it's there. In one way, `containsMatchingElement()` is very similar to `find()`: both are used to search for an element. When we are looking for multiple elements of different types, though, we can't use `find`. Instead we need to rely on a variant of `containsMatchingElement()`, `containsAllMatchingElements()`. This takes in an array of elements and returns `true` if all are present.

### Task (10 minutes)
1) Write a test using `containsMatchingElement()` to check for the presence of a CommentList component.

2) Write a test using `containsAllMatchingElements()` to make sure both components are being rendered together.

<details>
<summary>Solution</summary>

```js
// CommentBox.test.js

  it("should render a CommentList", () => {
    expect(wrapper.containsMatchingElement(
      <CommentList />
    )).toEqual(true);
  });

  it("should render CommentForm and CommentList together", () => {
    expect(wrapper.containsAllMatchingElements([
      <CommentForm />,
      <CommentList />
    ])).toEqual(true);
  });

```
</details>



### Snapshots

Our test has shown that CommentBox is rendering the right things, but how do we know they're in the right place? Or the right size? Our test doesn't consider any of those things. Fortunately, Jest has a feature known as *snapshot testing* which will let us check.

Snapshot testing is done on shallow rendered components and compares the rendered component to a reference "snapshot" which is created the first time the test is run. When we make changes to the layout of our component the test will fail, since it will no longer match the reference. If our change was intentional and the effects expected we can update the reference snapshot to match the updated UI, preventing further failures. However, if the observed change was unexpected the failing test will flag it up and we can correct whatever caused it. 

Before we can test a snapshot we need to update our packages. Add the `enzyme-to-json` package as a dev dependency:

```sh
npm i -D enzyme-to-json
```

Next we need to add some configuration details to `package.json`:

```json
//package.json
"jest": {
    "snapshotSerializers": ["enzyme-to-json/serializer"]
  }
```

Let's add a snapshot test for our CommentBox. We can use another of Jest's `expect` tools, this time `toMatchSnapshot()`:

```js
// CommentBox.test.js

  it('renders correctly', () => {
    expect(wrapper).toMatchSnapshot();
  });

```

When we save the file the watcher will run the test and we'll be prompted to save a snapshot, since this is the first time it has run. Each component's snapshot is saved in a `__snapshots__` directory at the same level as the component, with the file having the name of the test plus a `.snap` extension.

## Full DOM Rendering

Shallow rendering is great for testing that all our forms and buttons are appearing on the page, but it doesn't tell us anything about what happens when we interact with them. We can test that using *full DOM rendering*, which we can implement using Enzyme's `mount` function. Unlike shallow rendering, this creates the component and all of its child components in full, including all functionality. We can simulate events such as mouse clicks and form submissions and monitor how the component handles them. Let's set up some more tests:

```js
// CommentBox.test.js

describe("Mounted CommentBox", () => {

  
});

```

Jest provides a tool to help us test our functions in the form of *spies*. By spying on a function we can track how often it is called. If the function we spy on is an event listener we can make sure that it is being called at the correct time. 

We have two event listeners in our CommentBox: `handleCommentSubmit()` (which adds new comments when the form is submitted) and `handleCommentDelete()` (which deletes all comments when a button is clicked).  Let's start by testing that our delete button is calling the correct method:

```js
// CommentBox.test.js

  it("should call handleCommentDelete when the delete button is clicked", () => {
  
   });

```

The first step in testing a function is adding a spy, using Jest's `spyOn()` function:

```js
// CommentBox.test.js

  it("should call handleCommentDelete when the delete button is clicked", () => {
    const spy = jest.spyOn(CommentBox.prototype, "handleCommentDelete");		// NEW
    const wrapper = mount(<CommentBox/>)										// NEW
   });

```

We pass two arguments to `spyOn()`: the component the function is defined in and the name of the function to watch. Once we've added the spy we `mount` a `CommentBox` so that we can manipulate it for testing.

We use the `find()` method to find the delete button and `simulate()` to simulate the submit event, then check that our function has been called.

```js
// CommentBox.test.js

  it("should call handleCommentDelete when the delete button is clicked", () => {
    const spy = jest.spyOn(wrapper.instance(), "handleCommentDelete");
	wrapper.find("#delete-button").simulate("submit");					// NEW
    expect(spy).toHaveBeenCalledTimes(1);								// NEW
  });

```

We have verified that our delete button is working as expected, but it's rendered in our CommentBox component. How would we go about testing a function like `handleCommentSubmit()` where the button it is listening for is rendered by a child component? 

We set up our spy and make the assertion in the same way as before:

```js
// CommentBox.test.js

  it("should call handleCommentSubmit when a comment is submitted", () => {
    const spy = jest.spyOn(CommentBox.prototype, "handleCommentSubmit");
    const wrapper = mount(<CommentBox/>)
    	// Leave a gap here...
    expect(spy).toHaveBeenCalledTimes(1);
  });

```

We can spy on the function in the same way as before, since it's defined within the same component. The button we need to press in order to call the funciton is in a different component though, so we can't simulate the event just yet. Using `mount` has fully rendered all of CommentBox's child components, so we can use `find()` to locate the one where our function is called:

```js
// CommentBox.test.js

  it("should call handleCommentSubmit when a comment is submitted", () => {
    const spy = jest.spyOn(CommentBox.prototype, "handleCommentSubmit");
    const wrapper = mount(<CommentBox/>)
    const form = wrapper.find("CommentForm");			// NEW
    expect(spy).toHaveBeenCalledTimes(1);
  });

```
Now we have found our child component we can call some of the functions associated with it. We're testing the method for submitting a comment which requires information about the comment we want to submit. That's stored in the form's state, so we provide some dummy data:

```js
// CommentBox.test.js

  it("should call handleCommentSubmit when a comment is submitted", () => {
    const spy = jest.spyOn(CommentBox.prototype, "handleCommentSubmit");
    const wrapper = mount(<CommentBox/>)
    const form = wrapper.find("CommentForm");
    form.instance().setState({author: "Colin", text: "React is great!"});		// NEW
    expect(spy).toHaveBeenCalledTimes(1);
  });

```
Now we can add our comment! We can find our button and simulate the submit event in the same way as we did when deleting comments: 

```js
// CommentBox.test.js

  it("should call handleCommentSubmit when a comment is submitted", () => {
    const spy = jest.spyOn(CommentBox.prototype, "handleCommentSubmit");
    const wrapper = mount(<CommentBox/>)
    const form = wrapper.find("CommentForm");
    form.instance().setState({author: "Colin", text: "React is great!"});
    form.find("#submit-button").simulate("submit");					// NEW
    expect(spy).toHaveBeenCalledTimes(1);
  });

```
Success! We've tested our CommentBox container!

## Recap

What do we use snapshot testing for?

<details>
<summary>Answer</summary>

To ensure that elements are rendered in the correct order and that they are styled correctly.

</details>

What does full DOM rendering allow us to do that shallow rendering doesn't?

<details>
<summary>Answer</summary>

Test the functions defined within a component, including those called by a child component.

</details>



## Conclusion

We have used Jest to test the front end of our React application. We've used shallow rendering to make sure that all the elements are being rendered and used snapshots to make sure they're in the right place on the screen. We've also used full DOM rendering to test the functions defined in our components, including instances where the function is called by a child component.
