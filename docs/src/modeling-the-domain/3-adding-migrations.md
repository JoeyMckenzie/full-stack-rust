# Adding migrations

Okay... finally some code. As we're developing our application, it would benefit us to split out certain layers into individual crates. Right now, we can think of three distinct layers our application will have:

1. `blog-web` - our yew-based UI crate
2. `blog-service` - the core service of our application where we'll house business logic and persistence concerns 
3. `blog-api` - the API layer of our application, responsible for communication between the UI and the core service crates
4. `blog-bin` - an entry point into our application, responsible for wiring everything together and executing the application

Since we're taking a multi-crate approach to developing our application code, we'll tap into the power of [cargo workspaces](https://doc.rust-lang.org/book/ch14-03-cargo-workspaces.html), a cargo feature allowing us to build cargo projects (either `lib`s or `bin`s) in tandem while keeping concerns separate.

To create a cargo workspace, all we need is a single `Cargo.toml` file at the root of our folder. Let's go ahead and create one with the following content:

```toml
[workspace]
members = []
```

The `[workspace]` tags tells cargo we're in the context of a workspace with `members` being a string array of child crates within the workspace.

We don't have crates so far, so let's add our core service crate so we can begin setting up our database using migrations. Within our current workspace folder, run:

```bash
cargo new --lib blog-service
```

and update our root `Cargo.toml` file:

```toml
[workspace]
members = ["blog-service"]
```