defmodule Flagex.FeatureFlag.Processor.Condition do
  alias Flagex.FeatureFlag.Schema.Condition

  def call(
        %Condition{} = condition,
        params
      ) do
    condition
    |> prepare(params)
    |> evaluate()
  end

  defp prepare(condition, params) do
    bindings =
      Map.to_list(params)
      |> Enum.map(fn {key, value} -> {String.to_atom(key), value} end)

    {condition.condition, bindings}
  end

  defp evaluate({condition, bindings}) do
    do_evaluate(condition, bindings)
  end

  @spec do_evaluate(String.t(), Keyword.t()) :: Tuple
  def do_evaluate(condition, bindings) do
    evaluator().evaluate(condition, bindings)
  end

  defp evaluator do
    :flagex
    |> Application.fetch_env!(__MODULE__)
    |> Keyword.get(:code_evaluator)
  end
end
