defmodule Flagex.FeatureFlag.Builder.Result do
  alias Flagex.FeatureFlagResult, as: Result
  alias Flagex.FeatureFlag.Schema.{Flag, Option}

  def build(%Flag{} = feature_flag) do
    %Result{
      name: feature_flag.name,
      status: feature_flag.status,
      active: true
    }
  end

  def build(%Flag{} = feature_flag, %Option{status: status}) do
    %Result{
      name: feature_flag.name,
      status: status,
      active: true
    }
  end
end
