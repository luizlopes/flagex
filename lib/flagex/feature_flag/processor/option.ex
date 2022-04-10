defmodule Flagex.FeatureFlag.Processor.Option do
  alias Flagex.FeatureFlag.Processor.Rule, as: RuleProcessor
  alias Flagex.FeatureFlag.Schema.{Option, Rule}

  @default_result {:ok, false}

  def call(
        %Option{
          rules: [%Rule{} | _] = rules
        },
        params
      ) do
    do_call(rules, params)
  end

  def call(_, _params), do: @default_result

  defp do_call([%Rule{} = rule | rules], params) do
    case RuleProcessor.call(rule, params) do
      {:ok, true} -> {:ok, true}
      _ -> do_call(rules, params)
    end
  end

  defp do_call([_ | rules], params), do: do_call(rules, params)
  defp do_call([], _params), do: @default_result
end
