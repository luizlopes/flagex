defmodule FlagexWeb.FeatureFlagsController do
  use FlagexWeb, :controller

  alias Flagex.FeatureFlagResult, as: Result

  action_fallback FlagexWeb.FallbackController

  def show(conn, %{"name" => name} = params) do
    with result <- Flagex.process_feature_flag(name, params),
         %Result{error: nil} <- result do
      conn
      |> put_status(:ok)
      |> render("show.json", result: result)
    end
  end
end
