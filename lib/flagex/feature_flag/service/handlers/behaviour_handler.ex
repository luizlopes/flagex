defmodule Flagex.FeatureFlag.Service.BehaviourHandler do
  alias Flagex.Result

  @callback handle(Result.t(), Command.t()) :: Result.t()
end
