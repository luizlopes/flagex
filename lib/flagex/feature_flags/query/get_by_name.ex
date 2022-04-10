defmodule Flagex.FeatureFlags.Query.GetByName do
  import Ecto.Query

  alias Flagex.{Error, Repo}
  alias Flagex.FeatureFlag.Schema.Flag

  def call(name) do
    case execute_query(name) do
      %Flag{} = feature_flag -> {:ok, feature_flag}
      nil -> {:error, Error.build_not_found_error()}
    end
  end

  def execute_query(name) do
    Repo.one(
      from feature_flag in Flag,
        where: feature_flag.name == ^name,
        left_join: feature_flag_options in assoc(feature_flag, :options),
        left_join: feature_flag_option_rules in assoc(feature_flag_options, :rules),
        left_join:
          feature_flag_option_rule_conditions in assoc(
            feature_flag_option_rules,
            :conditions
          ),
        preload: [
          options: {feature_flag_options, rules: {feature_flag_option_rules, :conditions}}
        ]
    )
  end
end
