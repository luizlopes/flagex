defmodule Flagex.FeatureFlags.Processor do
  alias Flagex.{FeatureFlag, FeatureFlagOption}
  alias Flagex.FeatureFlags.{OptionProcessor, Result}

  def call(
        %FeatureFlag{feature_flag_options: [%FeatureFlagOption{} | _tail] = options} =
          feature_flag,
        params
      ) do
    do_call(feature_flag, options, params)
  end

  def call(%FeatureFlag{} = feature_flag, _params), do: Result.build(feature_flag)

  defp do_call(feature_flag, [%FeatureFlagOption{} = option | options], params) do
    case OptionProcessor.call(option, params) do
      {:ok, true} -> Result.build(feature_flag, option)
      {:ok, false} -> do_call(feature_flag, options, params)
    end
  end

  defp do_call(feature_flag, [_ | options], params), do: do_call(feature_flag, options, params)
  defp do_call(feature_flag, [], _params), do: Result.build(feature_flag)
end
