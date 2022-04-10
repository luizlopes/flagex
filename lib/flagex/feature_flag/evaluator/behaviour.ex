defmodule Flagex.FeatureFlag.Evaluator.Behaviour do
  @callback evaluate(String.t(), Keyword.t()) :: {:ok, boolean}
end
