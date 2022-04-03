defmodule Flagex.Repo.Migrations.RemoveFieldStatusFromFeatureFlagsOptionsTable do
  use Ecto.Migration

  def change do
    alter table(:feature_flag_options_table) do
      remove :status
    end
  end
end
