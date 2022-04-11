defmodule Flagex.FeatureFlag.Handler.Behaviour do
  alias Flagex.FeatureFlagResult, as: Result

  @callback handle(Result.t(), Command.t()) :: Result.t()
end
