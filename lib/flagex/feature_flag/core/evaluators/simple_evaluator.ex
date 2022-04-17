defmodule Flagex.FeatureFlag.Core.SimpleEvaluator do
  @behaviour Flagex.FeatureFlag.Core.EvaluatorBehaviour

  def evaluate(conditional, bindings) do
    Code.eval_string(conditional, bindings)
    |> handle_result()
  end

  defp handle_result({true, _}), do: {:ok, true}
  defp handle_result(_), do: {:ok, false}
end
