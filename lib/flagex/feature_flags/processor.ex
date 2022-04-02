defmodule Flagex.FeatureFlags.Processor do
  alias Flagex.FeatureFlag
  alias Flagex.FeatureFlags.Result

  def call(%FeatureFlag{} = feature_flag, _params) do
    Result.build(feature_flag)
  end
end
