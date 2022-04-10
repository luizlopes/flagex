defmodule FlagexWeb.FeatureFlagsView do
  use FlagexWeb, :view

  alias Flagex.FeatureFlag.Result

  def render("show.json", %{result: result = %Result{}}) do
    %{
      status: result.status,
      name: result.name,
      active: result.active,
      errors: result.errors
    }
  end
end
