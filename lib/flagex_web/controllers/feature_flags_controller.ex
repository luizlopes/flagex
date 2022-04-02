defmodule FlagexWeb.FeatureFlagsController do
  use FlagexWeb, :controller

  alias Flagex.FeatureFlags.GetByName

  action_fallback FlagexWeb.FallbackController

  def show(conn, %{"name" => name}) do
    with {:ok, feature_flag} <- GetByName.call(name) do
      conn
      |> put_status(:ok)
      |> render("show.json", feature_flag: feature_flag)
    end
  end
end
