# Paironauts

An app to help you find a pair programming partner or mob programming group

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
