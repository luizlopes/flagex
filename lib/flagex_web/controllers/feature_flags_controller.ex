defmodule FlagexWeb.FeatureFlagsController do
  use FlagexWeb, :controller

  alias Flagex.FeatureFlag

  action_fallback FlagexWeb.FallbackController

  def show(conn, %{"name" => name} = params) do
    with {:ok, result} <- FeatureFlag.process(name, params) do
      conn
      |> put_status(:ok)
      |> render("show.json", result: result)
    end
  end
end
