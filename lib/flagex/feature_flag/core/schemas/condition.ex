defmodule Flagex.FeatureFlag.Core.Condition do
  use Ecto.Schema
  import Ecto.Changeset

  alias Flagex.FeatureFlag.Core.Rule

  @required_params [:active, :condition, :feature_flag_option_rule_id]
  @derive {Jason.Encoder, only: @required_params}

  schema "feature_flag_option_rule_conditions" do
    field :active, :boolean
    field :description, :string
    field :condition, :string

    belongs_to :feature_flag_option_rule, Rule

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
