defmodule Flagex.FeatureFlag.Core.FlagProcessor do
  alias Flagex.FeatureFlag.Core.{Flag, Option, OptionProcessor, ResultBuilder}

  def call(
        %Flag{options: [%Option{} | _tail] = options} = feature_flag,
        params
      ) do
    do_call(feature_flag, options, params)
  end

  def call(%Flag{} = feature_flag, _params), do: ResultBuilder.build(feature_flag)

  defp do_call(feature_flag, [%Option{} = option | options], params) do
    case OptionProcessor.call(option, params) do
      {:ok, true} -> ResultBuilder.build(feature_flag, option)
      {:ok, false} -> do_call(feature_flag, options, params)
    end
  end

  defp do_call(feature_flag, [_ | options], params), do: do_call(feature_flag, options, params)
  defp do_call(feature_flag, [], _params), do: ResultBuilder.build(feature_flag)
end
