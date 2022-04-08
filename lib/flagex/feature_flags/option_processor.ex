defmodule Flagex.FeatureFlags.OptionProcessor do
  alias Flagex.{FeatureFlagOption, FeatureFlagOptionRule}
  alias Flagex.FeatureFlags.{RuleProcessor}

  @default_result {:ok, false}

  def call(
        %FeatureFlagOption{
          feature_flag_option_rules: [%FeatureFlagOptionRule{} | _] = rules
        },
        params
      ) do
    do_call(rules, params)
  end

  def call(_, _params), do: @default_result

  defp do_call([%FeatureFlagOptionRule{} = rule | rules], params) do
    case RuleProcessor.call(rule, params) do
      {:ok, true} -> {:ok, true}
      _ -> do_call(rules, params)
    end
  end

  defp do_call([_ | rules], params), do: do_call(rules, params)
  defp do_call([], _params), do: @default_result
end
