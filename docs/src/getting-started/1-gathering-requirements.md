# Gathering requirements

Like any web application developer, we've more than likely been part of a product team at one point in time looking to deliver value in some form or another. For us and our spectacular blog, it's worth while to layout a set of criteria that should act as our minimum viable product, often referred to as an MVP, to deliver to users when our work is all said and done.

With our blog, we should expect at the _very_ minimum our users should be able to:

- Navigate to our blog website in a browser of their choice
- Expect a list of blogs upon landing on the home page
- Navigate to individual blogs selecting a blog from the presented list
- Sign up for an account
- Login to an existing account
- Create blogs from a form once authenticated
- Edit an existing blog, given they're the original author

While not _exactly_ a trivial list of blogging website functionality, we cover a lot of bases by providing a basic set of workflows a user can expect from our web app. Not _quite_ exactly reaching feature parity with Facebook, but this will do for our purposes of exploring what Rust is capable of for building fullstack web applications. 

I've found during my time as a seasoned software developer ~~riddled with imposter syndrome~~, it's often beneficial to think like our non-technical peers when developing features in the sense product first engineering. With our basic usecases lined out, let's take an example from the first bullet point in the above list as a Gherkin-style feature:

```
As a user,
When I navigate to the home page,
I expect to be presented a list of blogs from various authors
```

Breaking this down, we can start to think in _units of work_, or small batches of deliverable features that together comprise a user experience. While this story may be a bit vague, the gears in head should begin turning. 

When a user lands on the page, they're _somehow_ presented with a list of blogs - okay, seems pretty straight forward. User lands on the page, we fire off a request on the frontend to fetch data from our backend service/API, the service processes the requests, talks to a database _somewhere_, and responds to the UI request with a (presumably JSON) serialized list of blog post data.

We're thinking in terms of _vertical slices_, cross cutting features in which the work to fulfill the specification set out by said feature requires us to touch multiple layers of our application.

As we start getting into the code, we'll take a step back at each point to analyze what needs to be done and discuss which parts of the stack we'll need to work with. 