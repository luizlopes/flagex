defmodule FlagexWeb.FeatureFlagsControllerTest do
  use FlagexWeb.ConnCase, async: true

  describe "show/2" do
    test "across the sea", %{conn: conn} do
      params = %{}

      response =
        conn
        |> post(Routes.feature_flags_path(conn, :show, "my_test", params))
        |> json_response(:ok)

      assert %{"feature" => "my_test", "status" => false} = response
    end
  end
end
