defmodule Flagex.FeatureFlagOption do
  use Ecto.Schema
  import Ecto.Changeset

  alias Flagex.FeatureFlag

  @required_params [:description, :status, :active, :feature_flag_id]
  @derive {Jason.Encoder, only: @required_params}

  schema "feature_flag_options" do
    field :description, :string
    field :status, :boolean
    field :active, :boolean

    belongs_to :feature_flag, FeatureFlag

    timestamps()
  end

  def changeset(params) do
    %Flagex.FeatureFlagOption{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:description, min: 5)
  end
end
