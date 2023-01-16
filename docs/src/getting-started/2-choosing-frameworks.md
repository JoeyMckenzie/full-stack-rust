# Choosing frameworks
While our choice of libraries in the Rust ecosystem is large and vast, we'll scope ourselves in to a few major framework crates to help us facilitate our application logic. I'll preface this in saying I am picking libraries _purely_ out of preference - you are more than welcome to BYOC (bring your own crates)!

## Picking a UI framework

Let's start with the outermost layer of the stack, our presentation layer. There are a handful of wonderful community-driven options to build Rust web applications for the browser with the help of WASM. A quick web search presents us with options for crates to utilize, each with their own flavors of developer experience, performance, tooling, etc. There's [Leptos](https://docs.rs/leptos/latest/leptos/#), [Sycamore](https://sycamore-rs.netlify.app/), [Dioxus](https://dioxuslabs.com/) for targeting multiple devices, etc.

Either of these projects would more than suffice for our use case, and again purely out of preference, I'll be using [Yew](https://yew.rs/) as it is well supported, actively maintained, and heavily inspired by React - if you're coming from React or have a passing familiarity with the library, you'll feel right at home with Yew.

**Our pick**: Yew ✅

## Picking a web framework

Onto the next, our web application framework. It may not be surprising to learn the web application framework ecosystem for Rust is quite a bit more mature than the web-based UI crates out there. Again, there is no shortage of frameworks to choose from and for our purpose of building a simple blogging engine. We'll be using [axum](https://docs.rs/axum/latest/axum/), particularly for its community and being backed by [tokio](https://tokio.rs/). I've written a few toy projects with axum and have thoroughly enjoyed the experience, so axum it is!

**Our pick**: Axum ✅

## Picking a tool for database interaction

With our UI and web frameworks of choice in place, let's take a look at crates to help us orchestrate talking with a database, making queries and mutations, handling migrations, etc. Three options come to mind: [Diesel](http://diesel.rs/), [SeaORM](https://www.sea-ql.org/SeaORM/), and [sqlx](https://docs.rs/sqlx/latest/sqlx/). While the first two options in the preceding identify more as traditional [ORM](https://en.wikipedia.org/wiki/Object%E2%80%93relational_mapping) frameworks, sqlx is more aligned as a micro-ORM providing a basic set of utilities to allow us to connect to databases, perform queries against the database server, manage connections and schemas, and my favorite feature of sqlx... compile-time checks of queries! 

Compile-time checks enforce correct code between our data access layer and the database system. With these checks in place, we greatly reduce the risk of unforeseen errors regarding tables or columns not existing and types not aligning. As a personal preference, I tend to leverage non-ORM tools wherever I can rather than there ORM peers so the choice for me is naturally sqlx.

**Our pick**: SQLx ✅

## Other considerations

While Yew, Axum, and SQLx will comprise the dominate framework crates in there respective layers, we'll leverage a handful of useful libraries all throughout our project to make our job a bit easier. 