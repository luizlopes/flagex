defmodule Flagex.FeatureFlags.Result do
  @derive {Jason.Encoder, only: [:name, :status, :active, :errors]}

  defstruct [:name, :status, :active, errors: false]

  alias Flagex.{FeatureFlag, FeatureFlagOption}

  def build(%FeatureFlag{} = feature_flag) do
    %__MODULE__{
      name: feature_flag.name,
      status: feature_flag.status,
      active: true
    }
  end

  def build(%FeatureFlag{} = feature_flag, %FeatureFlagOption{status: status}) do
    %__MODULE__{
      name: feature_flag.name,
      status: status,
      active: true
    }
  end
end
