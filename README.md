Faye integration with Rails via Redis
==

First, just to be clear, what this app is not: 
This application is **not** a working, production level app -- it is a proof of concept for a messaging back-end.

For my final project in General Assembly's Web Development Immersive course, I endeavored to build a messaging service. As WDI is a course designed to teach web development with a heavy focus on Rails applications, that was a large contstraint. Of course I am aware that Faye integrates with Node.js just as easily as it does with a Ruby Rack server; however, I wanted (and needed) to build a Ruby on Rails application.

I did not fully comprehend the complexity of what I wanted to build when I set out, as I'm sure will be the case almost any time I build anything new.

After much toiling, and some really invaluable insight and guidance from my instructor Jeff (@jkonowitch), I discovered an architecture that successfully allowed a Redis key-value store && pub/sub instance to forward messages to Faye, which would act simply as a push service for those messages.

This was accomplished using redis-cli to pushlish messages to the server-side Faye client, which was running on a Faye rack server. This skips the step where a user submits the message as a POST request to Rails, at which point the message would be persisted and forwarded to Redis.

Of course, there are still the matters of authetication, authorizaiton, and channel subscription management, but what I saw as the most difficult aspect of the architecture had been solved.

Feel free to play with and suggest any more robust implementations; another constraint I placed on myself was to **not** use a paid push service, like Pusher (although that would also be a great alternative).

