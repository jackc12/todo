# Todo

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



## Run tests
`mix test`


## Start server locally
`mix phx.server`


## Setup Database

create database
`initdb todo_dev`

start database
`pg_ctl -D todo_dev start`

stop database
`pg_ctl -D todo_dev stop`

create postgres user that can create databases
`createuser -d postgres`

Create the storage for the given repository.
`mix ecto.create`


## Generate controller, views, and context
`mix phx.gen.html Todos Todo_repo todos description:string priority:string is_completed:boolean`

Apply Changes to database
`mix ecto.migrate`