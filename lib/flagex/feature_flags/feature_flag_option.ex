defmodule Flagex.FeatureFlagOption do
  use Ecto.Schema
  import Ecto.Changeset

  alias Flagex.{FeatureFlag, FeatureFlagOptionRule}

  @required_params [:description, :active, :status, :feature_flag_id]
  @derive {Jason.Encoder, only: @required_params}

  schema "feature_flag_options" do
    field :description, :string
    field :active, :boolean
    field :status, :boolean

    belongs_to :feature_flag, FeatureFlag

    has_many :feature_flag_option_rules, FeatureFlagOptionRule

    timestamps()
  end

  def changeset(params) do
    %Flagex.FeatureFlagOption{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:description, min: 5)
  end
end
