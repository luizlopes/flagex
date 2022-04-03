defmodule Flagex.Repo.Migrations.CreateFeatureFlagOptionRuleConditionsTable do
  use Ecto.Migration

  def change do
    create table(:feature_flag_option_rule_conditions) do
      add :active, :boolean
      add :description, :string
      add :condition, :string
      add :feature_flag_option_rule_id, references(:feature_flag_option_rules)

      timestamps()
    end
  end
end
