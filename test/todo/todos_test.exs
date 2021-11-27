defmodule Todo.TodosTest do
  use Todo.DataCase

  alias Todo.Todos

  describe "todos" do
    alias Todo.Todos.Todo_repo

    import Todo.TodosFixtures

    @invalid_attrs %{description: nil, is_completed: nil, priority: nil}

    test "list_todos/0 returns all todos" do
      todo_repo = todo_repo_fixture()
      assert Todos.list_todos() == [todo_repo]
    end

    test "get_todo_repo!/1 returns the todo_repo with given id" do
      todo_repo = todo_repo_fixture()
      assert Todos.get_todo_repo!(todo_repo.id) == todo_repo
    end

    test "create_todo_repo/1 with valid data creates a todo_repo" do
      valid_attrs = %{description: "todo description", is_completed: true, priority: "Low"}

      assert {:ok, %Todo_repo{} = todo_repo} = Todos.create_todo_repo(valid_attrs)
      assert todo_repo.description == "todo description"
      assert todo_repo.is_completed == true
      assert todo_repo.priority == "Low"
    end

    test "create_todo_repo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Todos.create_todo_repo(@invalid_attrs)
    end

    test "update_todo_repo/2 with valid data updates the todo_repo" do
      todo_repo = todo_repo_fixture()
      update_attrs = %{description: "todo updated description", is_completed: false, priority: "Medium"}

      assert {:ok, %Todo_repo{} = todo_repo} = Todos.update_todo_repo(todo_repo, update_attrs)
      assert todo_repo.description == "todo updated description"
      assert todo_repo.is_completed == true
      assert todo_repo.priority == "Medium"
    end

    test "update_todo_repo/2 with invalid data returns error changeset" do
      todo_repo = todo_repo_fixture()
      assert {:error, %Ecto.Changeset{}} = Todos.update_todo_repo(todo_repo, @invalid_attrs)
      assert todo_repo == Todos.get_todo_repo!(todo_repo.id)
    end

    test "delete_todo_repo/1 deletes the todo_repo" do
      todo_repo = todo_repo_fixture()
      assert {:ok, %Todo_repo{}} = Todos.delete_todo_repo(todo_repo)
      assert_raise Ecto.NoResultsError, fn -> Todos.get_todo_repo!(todo_repo.id) end
    end

    test "change_todo_repo/1 returns a todo_repo changeset" do
      todo_repo = todo_repo_fixture()
      assert %Ecto.Changeset{} = Todos.change_todo_repo(todo_repo)
    end
  end
end
