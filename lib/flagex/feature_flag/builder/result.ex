defmodule Flagex.FeatureFlag.Builder.Result do
  alias Flagex.Error
  alias Flagex.FeatureFlagResult, as: Result
  alias Flagex.FeatureFlag.Schema.{Flag, Option}

  def build do
    %Result{}
  end

  def build(%Flag{} = feature_flag) do
    %Result{
      name: feature_flag.name,
      status: feature_flag.status,
      active: true
    }
  end

  def build(%Error{} = error), do: %Result{error: error}

  def build(%Flag{} = feature_flag, %Option{status: status}) do
    %Result{
      name: feature_flag.name,
      status: status,
      active: true
    }
  end
end
