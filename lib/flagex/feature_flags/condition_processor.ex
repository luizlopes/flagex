defmodule Flagex.FeatureFlags.ConditionProcessor do
  alias Flagex.{FeatureFlagOptionRuleCondition}

  def call(
        %FeatureFlagOptionRuleCondition{} = condition,
        params
      ) do
    condition
    |> prepare(params)
    |> evaluate()
    |> handle_result()
  end

  defp prepare(condition, params) do
    bindings =
      Map.to_list(params)
      |> Enum.map(fn {key, value} -> {String.to_atom(key), value} end)

    {condition.condition, bindings}
  end

  # TODO Call adapter
  defp evaluate({condition, bindings}) do
    Code.eval_string(condition, bindings)
  end

  defp handle_result({true, _}), do: {:ok, true}
  defp handle_result(_), do: {:ok, false}
end
