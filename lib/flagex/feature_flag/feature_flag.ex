defmodule Flagex.FeatureFlag do
  alias Flagex.FeatureFlag.Processor.Flag, as: FlagProcessor
  alias Flagex.FeatureFlag.Query.GetByName
  alias Flagex.FeatureFlag.Schema.Flag

  def process(feature_flag_name, params) do
    GetByName.call(feature_flag_name)
    |> do_process(params)
  end

  defp do_process({:ok, %Flag{} = feature_flag}, params) do
    {:ok, FlagProcessor.call(feature_flag, params)}
  end

  defp do_process(error, _params), do: error
end
