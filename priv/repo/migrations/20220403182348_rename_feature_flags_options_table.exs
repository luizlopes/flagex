defmodule Flagex.Repo.Migrations.RenameFeatureFlagsOptionsTable do
  use Ecto.Migration

  def change do
    rename table(:feature_flag_options_table), to: table(:feature_flag_options)
  end
end
