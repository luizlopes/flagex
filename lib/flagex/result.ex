defmodule Flagex.FeatureFlagResult do
  @derive {Jason.Encoder, only: [:name, :status, :active, :errors]}

  defstruct [:name, :status, :active, errors: false]
end
