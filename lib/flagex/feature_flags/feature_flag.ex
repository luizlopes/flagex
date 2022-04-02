defmodule Flagex.FeatureFlag do
  use Ecto.Schema
  import Ecto.Changeset

  @required_params [:name, :status]
  @derive {Jason.Encoder, only: @required_params}

  schema "feature_flags" do
    field :name, :string
    field :status, :boolean

    timestamps()
  end

  def changeset(params) do
    %Flagex.FeatureFlag{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:name, min: 5)
  end
end
