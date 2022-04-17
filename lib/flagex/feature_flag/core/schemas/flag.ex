defmodule Flagex.FeatureFlag.Core.Flag do
  use Ecto.Schema
  import Ecto.Changeset

  alias Flagex.FeatureFlag.Core.Option

  @required_params [:name, :status]
  @derive {Jason.Encoder, only: @required_params}

  schema "feature_flags" do
    field :name, :string
    field :status, :boolean

    has_many :options, Option, foreign_key: :feature_flag_id, references: :id

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:name, min: 5)
  end
end
