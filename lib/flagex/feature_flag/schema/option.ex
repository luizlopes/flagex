defmodule Flagex.FeatureFlag.Schema.Option do
  use Ecto.Schema
  import Ecto.Changeset

  alias Flagex.FeatureFlag.Schema.{Flag, Rule}

  @required_params [:description, :active, :status, :feature_flag_id]
  @derive {Jason.Encoder, only: @required_params}

  schema "feature_flag_options" do
    field :description, :string
    field :active, :boolean
    field :status, :boolean

    belongs_to :feature_flag, Flag, foreign_key: :feature_flag_id, references: :id

    has_many :rules, Rule, foreign_key: :feature_flag_option_id, references: :id

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
