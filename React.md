## JSX

+ Embedding Expressions in JSX
  
  ```js
  const name = 'Josh Perez';
  const element = <h1>Hello, {name}</h1>;
  ```

+ JSX is an Expression
  
  ```js
  function getGreeting(user) {
    if (user) {
      return <h1>Hello, {formatName(user)}!</h1>; *
    }
    return <h1>Hello, Stranger.</h1>; *
    }
  ```

+ Specifying Attributes with JSX 
  
  ```js
  //use quotes to specify string literals as attributes
  const element = <div tabIndex="0"></div>;
  //use curly braces
  const element = <img src={user.avatarUrl}></img>;
  ```

+ Specifying Children with JSX 
  
  ```js
  const element = <img src={user.avatarUrl} />;
  ```

+ JSX Prevents Injection Attacks 
  
  ```js
  const title = response.potentiallyMaliciousInput;
  // This is safe:
  const element = <h1>{title}</h1>;
  ```

+ Represents Objects 
  
  ```js
  //Babel compiles JSX down to React.createElement() calls.
  const element = React.createElement(
    'h1',
    {className: 'greeting'},
    'Hello, world!'
  );
  ```

## Element

  An element describes what you want to see on the screen: `const element = <h1>Hello, world</h1>`;

+ Rendering an Element into the DOM 
  
  ```js
  <div id="root"></div>
  
  //To render a React element into a root DOM node, pass both to ReactDOM.render():
  const element = <h1>Hello, world</h1>;
  ReactDOM.render(element, document.getElementById('root'));
  ```

+ Updating the Rendered Element 
  
  React elements are immutable.Once you create an element, you can’t change its children or attributes. the only way to update the UI is to create a new element, and pass it to `ReactDOM.render()`.
  
  ```js
  function tick() {
    const element = (
      <div>
        <h1>Hello, world!</h1>
        <h2>It is {new Date().toLocaleTimeString()}.</h2>
      </div>
    );
    ReactDOM.render(element, document.getElementById('root'));}
  
  setInterval(tick, 1000);
  ```

## Components and Props

Components let you split the UI into independent, reusable pieces, and think about each piece in isolation.Conceptually, components are like JavaScript functions.

+ Function and Class Components 
  
  The simplest way to define a component is to write a JavaScript function: 
  
  ```js
  //"props" = "properties"(属性)
  function Welcome(props) {
    return <h1>Hello, {props.name}</h1>;
  }
  ```

+ Rendering a Component