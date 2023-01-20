# Virtualization with dev containers

You may be wondering why we spent an entire section talking about which tools and CLIs we'll be using throughout our journey to build the world's most average blogging engine without actually _installing_ those tools. To make our life easy, we'll tap into the power of [dev containers, fully self-contained development environments fit with all the tools we need! Thanks to dev containers, long gone are the shouts from the mountain tops that "it works on my machine."

Dev containers allow us to define a single containerized development environment bootstrapped with all the SDKs, runtimes, tools, and CLIs we'll need and create a **reproducible** environment for anyone new to our project to simply spin up (via Docker or [GitHub Codespaces](https://github.com/features/codespaces)) and go.

Utilizing dev containers, we'll customize our container definition to include all the tools we need while being able to develop in a Linux-based environment similar to our production runtime environment. With this approach, we virtually eliminate the problems that can arise while developing different operating systems between local and production environments, while creating a _template_ environment for all developers on our team/project. Say goodbye to lengthy "dev setup" READMEs that no one keeps up-to-date, and say hello to containerized dev environments.
