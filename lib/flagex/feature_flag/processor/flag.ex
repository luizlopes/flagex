defmodule Flagex.FeatureFlag.Processor.Flag do
  alias Flagex.FeatureFlag.Result
  alias Flagex.FeatureFlag.Processor.Option, as: OptionProcessor
  alias Flagex.FeatureFlag.Schema.{Flag, Option}

  def call(
        %Flag{options: [%Option{} | _tail] = options} = feature_flag,
        params
      ) do
    do_call(feature_flag, options, params)
  end

  def call(%Flag{} = feature_flag, _params), do: Result.build(feature_flag)

  defp do_call(feature_flag, [%Option{} = option | options], params) do
    case OptionProcessor.call(option, params) do
      {:ok, true} -> Result.build(feature_flag, option)
      {:ok, false} -> do_call(feature_flag, options, params)
    end
  end

  defp do_call(feature_flag, [_ | options], params), do: do_call(feature_flag, options, params)
  defp do_call(feature_flag, [], _params), do: Result.build(feature_flag)
end
