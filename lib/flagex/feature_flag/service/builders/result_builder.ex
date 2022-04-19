defmodule Flagex.FeatureFlag.Service.ResultBuilder do
  alias Flagex.Error
  alias Flagex.Result

  def build do
    %Result{}
  end

  def build(%Error{} = error), do: %Result{error: error}
end
