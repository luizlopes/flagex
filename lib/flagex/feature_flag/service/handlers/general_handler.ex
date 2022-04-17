defmodule Flagex.FeatureFlag.Service.GeneralHandler do
  alias Flagex.FeatureFlag.Service.Command
  alias Flagex.Result

  @behaviour Flagex.FeatureFlag.Service.BehaviourHandler

  @impl true
  def handle(%Result{} = result, %Command{type: type} = command) do
    handlers = handlers(type)
    execute_handlers(result, command, handlers)
  end

  defp handlers(type) do
    :flagex
    |> Application.fetch_env!(__MODULE__)
    |> Map.get(type)
  end

  defp execute_handlers(result, command, [handler | handlers]) do
    handler.handle(result, command)
    |> execute_handlers(command, handlers)
  end

  defp execute_handlers(%Result{} = result, _command, []), do: result
end
