defmodule TodoWeb.TodoControllerTest do
  use TodoWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Listing Todos"
  end
end
