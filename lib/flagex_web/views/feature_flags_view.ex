defmodule FlagexWeb.FeatureFlagsView do
  use FlagexWeb, :view

  alias Flagex.Result

  def render("show.json", %{result: result = %Result{}}) do
    %{
      status: result.status,
      name: result.name,
      active: result.active,
      error: result.error
    }
  end
end
