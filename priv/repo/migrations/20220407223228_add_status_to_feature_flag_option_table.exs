defmodule Flagex.Repo.Migrations.AddStatusToFeatureFlagOptionTable do
  use Ecto.Migration

  def change do
    alter table(:feature_flag_options) do
      add :status, :boolean
    end
  end
end
