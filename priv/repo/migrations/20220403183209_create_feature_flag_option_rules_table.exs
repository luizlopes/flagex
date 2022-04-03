defmodule Flagex.Repo.Migrations.CreateFeatureFlagOptionRulesTable do
  use Ecto.Migration

  def change do
    create table(:feature_flag_option_rules) do
      add :active, :boolean
      add :description, :string
      add :feature_flag_option_id, references(:feature_flag_options)

      timestamps()
    end
  end
end
