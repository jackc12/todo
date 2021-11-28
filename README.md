# Todo

## UI

[Todo demo](http://65.49.81.74:4000/)

Install dependencies with `mix deps.get`

Run locally with `mix phx.server`


## Business Rules

[It is not permissible to save an item with empty description](https://github.com/jackc12/todo/blob/49a5ef63d3fd6301c94757f0b3f21bd47ae18233/lib/todo/todos/todo_repo.ex#L17)

[Priority must only allow the values (Low, Medium and High)](https://github.com/jackc12/todo/blob/49a5ef63d3fd6301c94757f0b3f21bd47ae18233/lib/todo/todos/todo_repo.ex#L18)

[Once an item is completed, it can not be unchecked and marked as not completed](https://github.com/jackc12/todo/blob/49a5ef63d3fd6301c94757f0b3f21bd47ae18233/lib/todo/todos.ex#L84)


## Tests

Run Tests
`mix test`

[Create with valid description, priority, is_completed](https://github.com/jackc12/todo/blob/49a5ef63d3fd6301c94757f0b3f21bd47ae18233/test/todo/todos_test.exs#L23)

[Update with valid description, priority, is_completed](https://github.com/jackc12/todo/blob/49a5ef63d3fd6301c94757f0b3f21bd47ae18233/test/todo/todos_test.exs#L36)

[Create with invalid description, priority, is_completed](https://github.com/jackc12/todo/blob/49a5ef63d3fd6301c94757f0b3f21bd47ae18233/test/todo/todos_test.exs#L32)

[Update with invalid description, priority, is_completed](https://github.com/jackc12/todo/blob/49a5ef63d3fd6301c94757f0b3f21bd47ae18233/test/todo/todos_test.exs#L46)


## Create database and schema for the following table and fields

Create database with `initdb todo_dev`

Start database with `pg_ctl -D todo_dev start`

Stop database with `pg_ctl -D todo_dev stop`

Create postgres user allowed to create databases with `createuser -d postgres`

Create database with with `mix ecto.create`

Generate controller, views, and context with `mix phx.gen.html Todos Todo_repo todos description:string priority:string is_completed:boolean`

Migrate your database with `mix ecto.migrate`