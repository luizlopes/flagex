defmodule FlagexWeb.FeatureFlagsController do
  use FlagexWeb, :controller

  alias Flagex.FeatureFlags

  action_fallback FlagexWeb.FallbackController

  def show(conn, %{"name" => name} = params) do
    with {:ok, result} <- FeatureFlags.process(name, params) do
      conn
      |> put_status(:ok)
      |> render("show.json", result: result)
    end
  end
end
