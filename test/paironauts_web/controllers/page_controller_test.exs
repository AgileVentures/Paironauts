defmodule PaironautsWeb.PageControllerTest do
  use PaironautsWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Paironauts"
  end
end
