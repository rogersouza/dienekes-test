defmodule DienekesWeb.Controllers.NumbersControllerTests do
  use DienekesWeb.ConnCase

  alias Dienekes.Numbers

  @numbers_per_page Application.get_env(:dienekes, :numbers_per_page)

  setup do
    :ok = Numbers.InMemoryDatabase.delete_all()
  end

  describe "when user request the sorted numbers" do
    test "case the sorted numbers are not in-memory yet" do
      conn = build_conn()

      response =
        conn
        |> get(Routes.numbers_path(conn, :get_numbers, %{"page" => "1"}))
        |> json_response(200)

      expected = %{"error" => "the numbers are being extracted"}

      assert response == expected
    end

    test "case the sorted numbers are already in-memory" do
      Numbers.update_numbers()
      :timer.sleep(100)

      conn = build_conn()

      response =
        conn
        |> get(Routes.numbers_path(conn, :get_numbers, %{"page" => "1"}))
        |> json_response(200)

      expected = %{"numbers" => Numbers.InMemoryDatabase.get()}

      assert response == expected
    end
  end

  describe "when user request an update" do
    test "returns a message indicating that the numbers are being updated" do
      conn = build_conn()

      response =
        conn
        |> get(Routes.numbers_path(conn, :update_numbers))
        |> json_response(200)

      expected = %{"message" => "updating"}

      assert response == expected
    end
  end

  describe "pagination" do
    test "a page has only @numbers_per_page numbers" do
      Numbers.update_numbers()
      :timer.sleep(100)

      conn = build_conn()

      response =
        conn
        |> get(Routes.numbers_path(conn, :get_numbers, %{"page" => "1"}))
        |> json_response(200)

      assert length(response["numbers"]) == @numbers_per_page
    end
  end
end
