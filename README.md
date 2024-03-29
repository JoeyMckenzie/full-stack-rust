# Fullstack Rust

[![Netlify Status](https://api.netlify.com/api/v1/badges/a087d1a2-fb0b-4749-bd3b-f9dcc18ca347/deploy-status)](https://app.netlify.com/sites/fullstackrust/deploys)

Welcome to Fullstack Rust, an introduction to building full stack web applications written entirely in Rust! Before we start our journey, we'll discuss a bit about what it means to be full stack, why we'd choose Rust to do such a task, and what we'll build throughout this series.

At any point in time should you need a reference to the source code or material covered in a chapter, feel free to explore any of the save point branches meant to serve as a time-snapshot of the code at any point during our development.

## Who am I?

My name is Joey McKenzie and I'm a Software Engineer at National Funding, a San Diego-based fintech company. By day, I'm a .NET developer working across the stack. I've worked in a variety of industries with many different technologies (heck, I've even spent some time working on the AS-400!) and have developed a passion for building fast, efficient web services. I love exploring different technologies, learning new ecosystems, and most of all talking tech with like minded folks!

As a disclaimer, I am in no way a Rust expert - I consider myself an enthusiastic hobbyist in the language and ecosystem looking to dive in deeper to what is offered by the language and the great people that build it. This series is meant to serve as an exploratory exercise into fullstack development offered by Rust, its advantages and tradeoffs, developer experience, etc.

For a more in depth look into building robust web services in Rust, please refer to [zero2prod](https://www.zero2prod.com/) created by the amazing [Luca Palmieri](https://github.com/LukeMathWalker/). I give all credit to the motivation for this series to Luca, as his contribution to the Rust ecosystem has been nothing less than incredible!

## What does it mean to be a "fullstack" application?

In the traditional sense, a fullstack web application is a single experience that attempts to deliver value to its particular domain by providing components at every level of application development. The more common components of a fullstack application include, but are not limited to:

- Some form of UI delivering the **presentation layer**
- Core application services, providing the **business logic layer**
- Data access components, providing the **data access layer**
- Miscellaneous infrastructure components, providing **cross-cutting concerns** utilized by each layer

Bundled together, these components form, more or less, what is commonly referred to as a fullstack application. Fullstack web application development can be found across many different language ecosystems (ASP.NET MVC, RoR, Django, etc.) with the goal of providing developers an experience typically driven by their language ecosystem of choice.

I'm of the opinion the term "fullstack" is a bit of a misnomer for the modern developer - many of us, at some point in our careers, have worked on, or inevitably _will_ work on, projects for organizations that require us to delve into the depths of the front and backend, profile pesky queries in our database, modifying IoC Terraform files in charge of deploying our services, etc. The point being that fullstack development ties the individual pieces of software development together to form a single user experience.

## Why Rust?

There are _many_ articles, blog posts, and tech talks that highlight Rust's strengths, weaknesses, and tradeoffs from other language ecosystems authored by individuals much more qualified than myself to answer that question. A quick search on the interwebs can unearth a plethora of information in regards as to why we would use Rust for web application development at every level of the stack (in the most basic form). I'll defer to said authors and individuals to provide more insight to the reader's interested in an answer.

What I _can_ say about Rust, as a primarily career TypeScript/.NET developer, is that Rust provides language constructs and paradigms that those languages simply lack or have been retrofitted over the years:

- One of the most robust type systems among many popular languages
- Expansive crate ecosystem providing solutions to many common problems that arise during web application development
- [`cargo`](https://doc.rust-lang.org/cargo/) - need I say more?

While the list could go on, I'll put it simply in that Rust has been a love language I've fell into and find any excuse to write whenever I get the chance.

## What are we building?

Throughout the series, we'll focus on building... _drumroll please_... a blog!

Yes, yes, I know... while a simple blog may not be the most fascinating application topic, it allows us to get our hands dirty in all of our predefined application layers:

- A UI to display our latest blog posts, as well as a form for authenticated users to create posts
- A web API to listen for requests from the frontend web app and orchestrate various business logic for CRUD operations for our users on their blog posts
- A data layer in charge of talking to our storage medium for persisting information
- Common libraries able to be consumed by any and all of our various application layers
- A robust CI/CD pipeline so we can seamlessly deploy incremental changes to our blog often
- Testing all throughout, including individual layers and between layers
- Everything written in Rust!

## Contact

If you have questions about the material, or simply want to say hi, you can contact me on my website at [joeymckenzie.tech](https://joeymckenzie.tech/)
