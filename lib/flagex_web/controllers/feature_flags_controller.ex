defmodule FlagexWeb.FeatureFlagsController do
  use FlagexWeb, :controller

  alias Flagex.FeatureFlags.{GetByName, Processor}
  alias Flagex.{FeatureFlag, Repo}

  action_fallback FlagexWeb.FallbackController

  def show(conn, %{"name" => name} = params) do
    with {:ok, feature_flag} <- GetByName.call(name),
         feature_flag <- preloads(feature_flag),
         result <- Processor.call(feature_flag, params) do
      conn
      |> put_status(:ok)
      |> render("show.json", result: result)
    end
  end

  defp preloads(%FeatureFlag{} = feature_flag) do
    feature_flag
    |> Repo.preload(
      feature_flag_options: [feature_flag_option_rules: [:feature_flag_option_rule_conditions]]
    )
  end
end
