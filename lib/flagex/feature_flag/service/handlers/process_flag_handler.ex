defmodule Flagex.FeatureFlag.Service.ProcessFlagHandler do
  alias Flagex.Error
  alias Flagex.FeatureFlag.Service.{Command, GetByNameQuery, ResultBuilder}
  alias Flagex.FeatureFlag.Core.{Flag, FlagProcessor}

  @behaviour Flagex.FeatureFlag.Service.BehaviourHandler

  @impl true
  def handle(_result, %Command{options: %{name: name, params: params}}) do
    GetByNameQuery.call(name)
    |> do_process(params)
  end

  defp do_process({:ok, %Flag{} = feature_flag}, params) do
    FlagProcessor.call(feature_flag, params)
  end

  defp do_process({:error, %Error{} = error}, _params), do: ResultBuilder.build(error)
end
