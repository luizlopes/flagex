defmodule Flagex.FeatureFlags.RuleProcessor do
  alias Flagex.{FeatureFlagOptionRuleCondition, FeatureFlagOptionRule}
  alias Flagex.FeatureFlags.{ConditionProcessor}

  @default_result {:ok, false}

  def call(
        %FeatureFlagOptionRule{
          feature_flag_option_rule_conditions:
            [%FeatureFlagOptionRuleCondition{} | _] = conditions
        },
        params
      ) do
    do_call(conditions, params)
  end

  def call(_, _), do: @default_result

  defp do_call([%FeatureFlagOptionRuleCondition{} = condition | conditions], params) do
    case ConditionProcessor.call(condition, params) do
      {:ok, false} -> {:ok, false}
      {:ok, true} -> do_call(conditions, params)
    end
  end

  defp do_call([_ | _], _params), do: {:ok, false}
  defp do_call([], _params), do: {:ok, true}
end
