defmodule FlagexWeb.FeatureFlagsViewTest do
  use FlagexWeb.ConnCase, async: true

  import Phoenix.View

  alias FlagexWeb.FeatureFlagsView
  alias Flagex.{FeatureFlag, Repo}

  test "renders show.json" do
    params = %{name: "my_test", status: false}

    {:ok, feature_flag} =
      params
      |> FeatureFlag.changeset()
      |> Repo.insert()

    response = render(FeatureFlagsView, "show.json", %{feature_flag: feature_flag})

    assert response == %{
             feature: "my_test",
             status: false
           }
  end
end
