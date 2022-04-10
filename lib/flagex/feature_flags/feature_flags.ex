defmodule Flagex.FeatureFlags do
  alias Flagex.FeatureFlags.Processor
  alias Flagex.FeatureFlags.Query.GetByName
  alias Flagex.FeatureFlag.Schema.Flag

  def process(feature_flag_name, params) do
    GetByName.call(feature_flag_name)
    |> do_process(params)
  end

  defp do_process({:ok, %Flag{} = feature_flag}, params) do
    {:ok, Processor.call(feature_flag, params)}
  end

  defp do_process(error, _params), do: error
end
