# Testing our API

We have a rough definition of what our API surface should look like, though we don't have an actual _functioning_ API. While putting the pieces together of what experience our API should offer up, it would benefit us to be able to test our API contracts at the edge.

At the edge testing, or simply testing our API returns the responses we expect, helps us drive what end users should anticipate calling into our various endpoints.

As a developer dealing primarily with web-based, I lean on [Postman](https://www.postman.com/) heavily to help drive the local development and testing of various web services I work on day-to-day. One feature I find helpful when think-tanking APIs with my co-workers is the [response testing](https://learning.postman.com/docs/writing-scripts/test-scripts/) Postman offers.

With response testing, we can validate certain endpoints return responses _as we expect_, asserting various properties on the response exist and even saving bits of response data to our local environment. Let's utilize this to help drive some of the response schemas we'll expect our users to consume. In the last section, we fleshed out a rough draft of what our API surface should look like, and using Postman, we can test our endpoints to verify they return the various bits of data we should expect a client to consume.
