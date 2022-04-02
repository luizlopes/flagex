defmodule FlagexWeb.FeatureFlagsView do
  use FlagexWeb, :view

  def render("show.json", %{feature_flag: feature_flag}) do
    %{
      feature: feature_flag.name,
      status: feature_flag.status
    }
  end
end
