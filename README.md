# Flagex

A feature flag and test AB API writen Elixir. [WIP]

## The main features of flag feature are:

  * Controls feature flags
  * Creates conditionals in execution time for evaluate feature flag state 
  * Feature flags Rollout
  * Counts feature flag hits and its results


## The main features of test AB are:

  * Controls the tests by an id (eg, session_id) 
  * Returns JSON (this is useful to reproduce the response of any API calls) 
  * Counts test hits and its results

## TODO

  * IMPROVE TEST COVERAGE
  * CI/CD
  * NEW HANDLER TO COMPUTE PROCESSED FLAGS
  * CREATE ALL TEST AB
  * DOCKERIZE
  * DEPLOY
  * LIVE VIEW FOR STATS VIEWS



To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
