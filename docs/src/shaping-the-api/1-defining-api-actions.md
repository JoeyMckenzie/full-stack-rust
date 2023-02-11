# Exposing API actions

We've built out a foundational database schema, now let's construct the API that our clients (a.k.a. our yew UI) will use. I like to call this _shaping the API_, or defining what actions a consumer can take to interact with the various endpoints we expose to the world. What should our blogging API offer in terms of acting as a headless engine for our consumers?

First and foremost, we need _some way_ for our users to create posts - so we'll probably need some mechanism to accept POST requests to `/api/blogs` that expect a request to contain various details about their blog like the title and content. In that same vein, it would be nice to also allow our users to update posts, so we'll need something along the lines of PUT to `/api/blogs/{{slug}}`, where we'll update a blog's content given the requestor is also the owning author of the blog post.

We'll need to retrieve single posts, as well as some way to search for posts as well, maybe to display the latest posts on the home page of our UI.

We also need authentication \*_gasps_\* - nothing too complicated.

> Disclaimer: authentication is wicked complicated. Don't do it yourself unless you have a great reason to, you're best suited to use some form of authentication provider like [Okta](https://www.okta.com/) or [Auth0](https://auth0.com/).

Our authentication portion we'll coin "poor man's" authentication, as we'll only be concerned about accepting user input with something like a username and password and validating the credentials against what we've stored for that particular user in our database.

With all that said, we can roughly sketch our API surface to look something like the following:

- GET `/api/blogs` - a search endpoint for clients to hit, also allowing them to send additional filters like a limit, offset, title, and author
- GET `/api/blogs/{{slug}}` - a retrieval endpoint that'll return all the various bits of a particular post's data to the caller
- POST `/api/blogs` - a place for users to submit blog posts given they provide us with all the necessary information to do so
- PUT `/api/blogs/{{slug}}` - an update endpoint to allow users to modify the content of their blog, given they're the rightful owner
- DELETE `/api/blogs/{{slug}}` - a place for users to get rid of their content should they feel the need
- POST `/api/users/registration` - we'll need to allow users to sign up, so we'll offer a basic registration endpoint given they provide us a valid username and password - we don't want to allow just _anyone_ to use our blogging engine
