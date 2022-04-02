defmodule Flagex.Repo.Migrations.CreateFeatureFlagsOptionsTable do
  use Ecto.Migration

  def change do
    create table(:feature_flag_options_table) do
      add :active, :boolean
      add :description, :string
      add :status, :boolean
      add :feature_flag_id, references(:feature_flags)

      timestamps()
    end
  end
end
