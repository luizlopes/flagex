defmodule FlagexWeb.FeatureFlagsController do
  use FlagexWeb, :controller

  action_fallback FlagexWeb.FallbackController

  def show(conn, %{"name" => name} = params) do
    with {:ok, result} <- Flagex.process_feature_flag(name, params) do
      conn
      |> put_status(:ok)
      |> render("show.json", result: result)
    end
  end
end
