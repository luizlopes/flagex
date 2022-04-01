defmodule FlagexWeb.FeatureFlagsViewTest do
  use FlagexWeb.ConnCase, async: true

  import Phoenix.View

  alias FlagexWeb.FeatureFlagsView

  test "renders show.json" do
    response = render(FeatureFlagsView, "show.json", %{name: "my_test"})

    assert response == %{
             feature: "my_test",
             status: false
           }
  end
end
