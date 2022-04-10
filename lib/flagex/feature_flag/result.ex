defmodule Flagex.FeatureFlag.Result do
  @derive {Jason.Encoder, only: [:name, :status, :active, :errors]}

  defstruct [:name, :status, :active, errors: false]
end
