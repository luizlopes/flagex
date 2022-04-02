defmodule Flagex.FeatureFlags.GetByName do
  alias Flagex.{Error, FeatureFlag, Repo}

  def call(name) do
    case Repo.get_by(FeatureFlag, name: name) do
      nil -> {:error, Error.build_not_found_error()}
      feature_flag -> {:ok, feature_flag}
    end
  end
end
