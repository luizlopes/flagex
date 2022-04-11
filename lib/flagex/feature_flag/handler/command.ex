defmodule Flagex.FeatureFlag.Handler.Command do
  alias Flagex.FeatureFlagResult, as: Result
  alias Flagex.FeatureFlag.Command

  def call(%Result{} = result, %Command{type: type} = command) do
    handlers = handlers(type)
    execute_handlers(command, result, handlers)
  end

  defp handlers(type) do
    :flagex
    |> Application.fetch_env!(__MODULE__)
    |> Map.get(type)
  end

  defp execute_handlers(result, command, [handler | handlers]) do
    handler.handle(command, result)
    |> execute_handlers(command, handlers)
  end

  defp execute_handlers(%Result{} = result, _command, []), do: result
end
