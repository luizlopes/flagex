defmodule Flagex.FeatureFlags.Query.GetByName do
  import Ecto.Query

  alias Flagex.{Error, FeatureFlag, Repo}

  def call(name) do
    case execute_query(name) do
      %FeatureFlag{} = feature_flag -> {:ok, feature_flag}
      nil -> {:error, Error.build_not_found_error()}
    end
  end

  def execute_query(name) do
    Repo.one(
      from feature_flag in FeatureFlag,
        where: feature_flag.name == ^name,
        left_join: feature_flag_options in assoc(feature_flag, :feature_flag_options),
        left_join:
          feature_flag_option_rules in assoc(feature_flag_options, :feature_flag_option_rules),
        left_join:
          feature_flag_option_rule_conditions in assoc(
            feature_flag_option_rules,
            :feature_flag_option_rule_conditions
          ),
        preload: [
          feature_flag_options:
            {feature_flag_options,
             feature_flag_option_rules:
               {feature_flag_option_rules, :feature_flag_option_rule_conditions}}
        ]
    )
  end
end
