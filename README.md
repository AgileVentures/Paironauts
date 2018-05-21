# Paironauts

Hello, we are Paironauts. We’re glad you’re thinking about boldly going with us!

Paironauts will give developers, aspiring and established, a platform to get together online and work on code collaboratively. There are many reasons it can be difficult to find partners to work with on coding projects: geographic isolation, a lack of confidence - especially if you’re just starting out on something, or just initial unfamiliarity with pair programming. We’re creating a platform that will reduce the friction that can prevent collaborations from happening. We want people to be able to open up Paironauts, find a great partner as easily as possible and start coding together, supported by a solid real-time web system.

There are many online platforms the allow users to interact in real-time for a some purpose (or none at all). Paironauts, as one of those, is focused specifically on supporting collaborative programming efforts - whether in pairs, or in “mobs” of more than two participants.

Please join us by attending.

We’d welcome anybody who wants to help us. We’re particularly in need of:

* Both UI and UX designers to think about and create a compelling and efficient user experience
* Developers with an interest in scalable real-time web systems

MVP at https://www.paironauts.org

## Development Installation

To start the Paironauts Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create Ecto migrations directory using...
    * (Mac/Linux) using `mkdir -p priv/repo/migrations`
    * (Windows) TBD
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `(cd assets && npm install)`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

UNDER CONSTRUCTION DOCS
========================

Domain model
-----------

There are users who come to the system to find other users to pair program with. Having found a pair or a mob, they will be connected in a video teleconference to allow coordination of mob or pair programming.

* users
* pairing sessions
* mobbing sessions 


Behaviours
----------

As a rabid pair programmer
So that I can pair program more
I would like to connect with other pair programmers and start pairing with them

As a rabid pair programmer
So that I can keep a record of my previous interactions with the system 
I would like to create an account

As a Paironauts Admin
So that we can better understand how users interact with our system
We'd like them to create accounts that allows us to determine the identity of different users
