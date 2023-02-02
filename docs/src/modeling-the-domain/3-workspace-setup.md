# Scaffolding crates

Okay... finally some code. As we're developing our application, it would benefit us to split out certain layers into individual crates. Right now, we can think of the distinct layers our application will have as:

1. `blog-web` - our yew-based UI crate
2. `blog-core` - the core service of our application where we'll house business logic and persistence concerns
3. `blog-api` - the API layer of our application, responsible for communication between the UI and the core service crates
4. `blog-bin` - an entry point into our application, responsible for wiring everything together and executing the application

We could also benefit from a crate housing our request/response models that the UI and API will pass back and forth - this, in essence, is the heart of full stack development. Being able to leverage common types that are understood by both our frontend and backend brings many benefits while eliminating an entire class of issues that can arise when passing information via serialization. For this purpose, we'll also throw in a `blog-domain` crate to act as a crate to be consumed by our core crates to act as a set of contracts the consumers should be held to while communicating back and forth.

Since we're taking a multi-crate approach to developing our application code, we'll tap into the power of [cargo workspaces](https://doc.rust-lang.org/book/ch14-03-cargo-workspaces.html), a cargo feature allowing us to build cargo projects (either `lib`s or `bin`s) in tandem while keeping concerns separate.

To create a cargo workspace, all we need is a single `Cargo.toml` file at the root of our folder. Let's go ahead and create one with the following content:

```toml
[workspace]
members = []
```

The `[workspace]` tags tells cargo we're in the context of a workspace with `members` being a string array of child crates within the workspace.

We don't have any crates so far, so let's add our core service crate so we can begin setting up our database using migrations. With sqlx migrations, we'll be able to evolve our database schema as our needs change in terms of persistence models. While we're at it, let's create a subdirectory for all of our crates to be housed for simple organziation purposes as well. Within our current workspace folder, run:

```bash
mkdir crates
cargo new --lib crates/blog-core
```

and update our root `Cargo.toml` file:

```toml
[workspace]
members = ["crates/*"]
```

By assigning our workspace members as `crates/*`, we avoid having to manually update our dependencies array and point cargo to the crates directory for all of its build specific needs. Pretty neat!
