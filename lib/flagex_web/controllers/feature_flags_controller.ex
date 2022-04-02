defmodule FlagexWeb.FeatureFlagsController do
  use FlagexWeb, :controller

  alias Flagex.FeatureFlags.{GetByName, Processor}

  action_fallback FlagexWeb.FallbackController

  def show(conn, %{"name" => name}) do
    with {:ok, feature_flag} <- GetByName.call(name),
         result <- Processor.call(feature_flag) do
      conn
      |> put_status(:ok)
      |> render("show.json", result: result)
    end
  end
end
