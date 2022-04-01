defmodule Flagex.FeatureFlags.GetByName do
  alias Flagex.{FeatureFlag, Repo}

  def call(name) do
    case Repo.get_by(FeatureFlag, name: name) do
      nil -> {:error, :not_found}
      feature_flag -> {:ok, feature_flag}
    end
  end
end
