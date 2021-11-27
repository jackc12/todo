defmodule TodoWeb.Todo_repoController do
  use TodoWeb, :controller

  alias Todo.Todos
  alias Todo.Todos.Todo_repo

  def index(conn, _params) do
    todos = Todos.list_todos()
    render(conn, "index.html", todos: todos)
  end

  def new(conn, _params) do
    changeset = Todos.change_todo_repo(%Todo_repo{})
    render(conn, "new.html", changeset: changeset, disabled: false)
  end

  def create(conn, %{"todo_repo" => todo_repo_params}) do
    case Todos.create_todo_repo(todo_repo_params) do
      {:ok, todo_repo} ->
        conn
        |> put_flash(:info, "Todo repo created successfully.")
        |> redirect(to: Routes.todo_repo_path(conn, :show, todo_repo))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset, disabled: false)
    end
  end

  def show(conn, %{"id" => id}) do
    todo_repo = Todos.get_todo_repo!(id)
    render(conn, "show.html", todo_repo: todo_repo)
  end

  def edit(conn, %{"id" => id}) do
    todo_repo = Todos.get_todo_repo!(id)
    changeset = Todos.change_todo_repo(todo_repo)
    render(conn, "edit.html", todo_repo: todo_repo, changeset: changeset, disabled: todo_repo.is_completed)
  end

  def update(conn, %{"id" => id, "todo_repo" => todo_repo_params}) do
    todo_repo = Todos.get_todo_repo!(id)

    case Todos.update_todo_repo(todo_repo, todo_repo_params) do
      {:ok, todo_repo} ->
        conn
        |> put_flash(:info, "Todo repo updated successfully.")
        |> redirect(to: Routes.todo_repo_path(conn, :show, todo_repo))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", todo_repo: todo_repo, changeset: changeset, disabled: todo_repo.is_completed)
    end
  end

  def delete(conn, %{"id" => id}) do
    todo_repo = Todos.get_todo_repo!(id)
    {:ok, _todo_repo} = Todos.delete_todo_repo(todo_repo)

    conn
    |> put_flash(:info, "Todo repo deleted successfully.")
    |> redirect(to: Routes.todo_repo_path(conn, :index))
  end
end
