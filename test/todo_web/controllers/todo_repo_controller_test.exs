defmodule TodoWeb.Todo_repoControllerTest do
  use TodoWeb.ConnCase

  import Todo.TodosFixtures

  @create_attrs %{description: "todo description", is_completed: true, priority: "Low"}
  @update_attrs %{description: "todo updated description", is_completed: false, priority: "Medium"}
  @invalid_attrs %{description: nil, is_completed: nil, priority: nil}

  describe "index" do
    test "lists all todos", %{conn: conn} do
      conn = get(conn, Routes.todo_repo_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Todos"
    end
  end

  describe "new todo_repo" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.todo_repo_path(conn, :new))
      assert html_response(conn, 200) =~ "New Todo repo"
    end
  end

  describe "create todo_repo" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.todo_repo_path(conn, :create), todo_repo: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.todo_repo_path(conn, :show, id)

      conn = get(conn, Routes.todo_repo_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Todo repo"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.todo_repo_path(conn, :create), todo_repo: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Todo repo"
    end
  end

  describe "edit todo_repo" do
    setup [:create_todo_repo]

    test "renders form for editing chosen todo_repo", %{conn: conn, todo_repo: todo_repo} do
      conn = get(conn, Routes.todo_repo_path(conn, :edit, todo_repo))
      assert html_response(conn, 200) =~ "Edit Todo repo"
    end
  end

  describe "update todo_repo" do
    setup [:create_todo_repo]

    test "redirects when data is valid", %{conn: conn, todo_repo: todo_repo} do
      conn = put(conn, Routes.todo_repo_path(conn, :update, todo_repo), todo_repo: @update_attrs)
      assert redirected_to(conn) == Routes.todo_repo_path(conn, :show, todo_repo)

      conn = get(conn, Routes.todo_repo_path(conn, :show, todo_repo))
      assert html_response(conn, 200) =~ "todo updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, todo_repo: todo_repo} do
      conn = put(conn, Routes.todo_repo_path(conn, :update, todo_repo), todo_repo: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Todo repo"
    end
  end

  describe "delete todo_repo" do
    setup [:create_todo_repo]

    test "deletes chosen todo_repo", %{conn: conn, todo_repo: todo_repo} do
      conn = delete(conn, Routes.todo_repo_path(conn, :delete, todo_repo))
      assert redirected_to(conn) == Routes.todo_repo_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.todo_repo_path(conn, :show, todo_repo))
      end
    end
  end

  defp create_todo_repo(_) do
    todo_repo = todo_repo_fixture()
    %{todo_repo: todo_repo}
  end
end
