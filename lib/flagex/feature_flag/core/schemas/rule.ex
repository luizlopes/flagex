defmodule Flagex.FeatureFlag.Core.Rule do
  use Ecto.Schema
  import Ecto.Changeset

  alias Flagex.FeatureFlag.Core.{Condition, Option}

  @required_params [:description, :active, :feature_flag_option_id]
  @derive {Jason.Encoder, only: @required_params}

  schema "feature_flag_option_rules" do
    field :description, :string
    field :active, :boolean

    belongs_to :feature_flag_option, Option

    has_many :conditions, Condition, foreign_key: :feature_flag_option_rule_id, references: :id
    # has_many :options, Option, foreign_key: :feature_flag_id, references: :id

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:description, min: 5)
  end
end
