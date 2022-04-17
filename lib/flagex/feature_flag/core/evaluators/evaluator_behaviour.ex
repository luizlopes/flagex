defmodule Flagex.FeatureFlag.Core.EvaluatorBehaviour do
  @callback evaluate(String.t(), Keyword.t()) :: {:ok, boolean}
end
