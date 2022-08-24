![Let's Build an event scheduling app with Ruby on Rails 7](https://f001.backblazeb2.com/file/webcrunch/event-scheduling-app-rails-7-cover.jpg)

# Let's Build an event scheduling app with Ruby on Rails 7


I recently posted a poll on YouTube about what "Let's Build" series to revamp, and the answer was a unanimous event scheduling type of Rails application.

In 2018, I published [Let's Build: With Ruby on Rails - Event Scheduling App with Payments](https://web-crunch.com/posts/lets-build-ruby-on-rails-event-scheduling-app-payments), which was my first attempt at such an app. A lot has changed since then with Rails and also Stripe.

In this tutorial, we build an application inspired by Calendly, an excellent tool for scheduling events or meetings with pre-established availability. Calendly seems simple on the surface, but once you start working with anything related to dates and time in programming, it starts to get complex fast.

This tutorial is in no way complete. The app's final version is downright scrappy, to be honest, but I wanted to take something out in the wild already and dumb it down into something you could rebuild with Rails.

## Goals for the app

The general idea is to mimic the primitive features of Calendly. An end user can visit a unique direct link to book events with someone else. These events can be free to book or require payment. Those that book events shouldn't be necessary to create an account. Those that make the events and availability slots **do** need an account.


- [🎥 Watch on YouTube](https://youtu.be/BMyqpMuqIUE)
- [📕 Read the written version](https://web-crunch.com/posts/event-scheduling-app-rails-7)
