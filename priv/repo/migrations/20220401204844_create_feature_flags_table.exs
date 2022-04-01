defmodule Flagex.Repo.Migrations.CreateFeatureFlagsTable do
  use Ecto.Migration

  def change do
    create table(:feature_flags) do
      add :name, :string
      add :status, :boolean

      timestamps()
    end

    create unique_index(:feature_flags, [:name])
  end
end
