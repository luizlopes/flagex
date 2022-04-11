defmodule Flagex.FeatureFlag.Handler.ProcessFlag do
  @behaviour Flagex.FeatureFlag.Handler.Behaviour

  alias Flagex.Error
  alias Flagex.FeatureFlag.Command
  alias Flagex.FeatureFlag.Builder.Result, as: ResultBuilder
  alias Flagex.FeatureFlag.Processor.Flag, as: FlagProcessor
  alias Flagex.FeatureFlag.Query.GetByName
  alias Flagex.FeatureFlag.Schema.Flag

  def handle(_result, %Command{options: %{name: name, params: params}}) do
    GetByName.call(name)
    |> do_process(params)
  end

  defp do_process({:ok, %Flag{} = feature_flag}, params) do
    FlagProcessor.call(feature_flag, params)
  end

  defp do_process({:error, %Error{} = error}, _params), do: ResultBuilder.build(error)
end
