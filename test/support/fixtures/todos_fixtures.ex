defmodule Todo.TodosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todo.Todos` context.
  """

  @doc """
  Generate a todo_repo.
  """
  def todo_repo_fixture(attrs \\ %{}) do
    {:ok, todo_repo} =
      attrs
      |> Enum.into(%{
        description: "Todo description",
        is_completed: true,
        priority: "Low"
      })
      |> Todo.Todos.create_todo_repo()

    todo_repo
  end
end
