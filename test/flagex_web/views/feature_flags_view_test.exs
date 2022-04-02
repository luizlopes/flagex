defmodule FlagexWeb.FeatureFlagsViewTest do
  use FlagexWeb.ConnCase, async: true

  import Phoenix.View

  alias FlagexWeb.FeatureFlagsView
  alias Flagex.FeatureFlags.Result

  test "renders show.json" do
    result = %Result{name: "my_test", status: true, active: true, errors: false}

    response = render(FeatureFlagsView, "show.json", %{result: result})

    assert response == %{status: true, active: true, errors: false, name: "my_test"}
  end
end
