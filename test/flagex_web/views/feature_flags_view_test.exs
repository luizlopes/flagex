defmodule FlagexWeb.FeatureFlagsViewTest do
  use FlagexWeb.ConnCase, async: true

  import Phoenix.View

  alias FlagexWeb.FeatureFlagsView
  alias Flagex.FeatureFlagResult, as: Result

  test "renders show.json" do
    result = %Result{name: "my_test", status: true, active: true, error: nil}

    response = render(FeatureFlagsView, "show.json", %{result: result})

    assert response == %{status: true, active: true, error: nil, name: "my_test"}
  end
end
