defmodule FlagexWeb.FeatureFlagsControllerTest do
  use FlagexWeb.ConnCase, async: true

  alias Flagex.{FeatureFlag, Repo}

  describe "show/2" do
    test "when feature flag name exists, returns a success response", %{conn: conn} do
      params = %{name: "my_test", status: false}

      params |> FeatureFlag.changeset() |> Repo.insert()

      response =
        conn
        |> post(Routes.feature_flags_path(conn, :show, "my_test", %{}))
        |> json_response(:ok)

      assert %{
               "status" => false,
               "active" => true,
               "errors" => false,
               "name" => "my_test"
             } = response
    end

    test "when feature flag doesnt exist, returns an error response", %{conn: conn} do
      response =
        conn
        |> post(Routes.feature_flags_path(conn, :show, "my_test", %{}))
        |> json_response(:not_found)

      assert %{"message" => "not found"} = response
    end
  end
end
