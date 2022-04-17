defmodule Flagex.FeatureFlag.Core.ResultBuilder do
  alias Flagex.Error
  alias Flagex.Result
  alias Flagex.FeatureFlag.Core.{Flag, Option}

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
