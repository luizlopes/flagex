defmodule Flagex.FeatureFlagOptionRule do
  use Ecto.Schema
  import Ecto.Changeset

  alias Flagex.FeatureFlagOption

  @required_params [:description, :active, :feature_flag_option_id]
  @derive {Jason.Encoder, only: @required_params}

  schema "feature_flag_option_rules" do
    field :description, :string
    field :active, :boolean

    belongs_to :feature_flag_option, FeatureFlagOption

    timestamps()
  end

  def changeset(params) do
    %Flagex.FeatureFlagOptionRule{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:description, min: 5)
  end
end
