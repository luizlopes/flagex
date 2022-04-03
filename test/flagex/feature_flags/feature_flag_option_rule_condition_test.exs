defmodule Flagex.FeatureFlagOptionRuleConditionTest do
  use Flagex.DataCase, async: true

  import Flagex.Factory

  alias Flagex.{FeatureFlagOptionRuleCondition}

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      feature_flag_option_rule = build(:feature_flag_option_rule)

      params =
        build(:feature_flag_option_rule_condition_params, %{
          "feature_flag_option_rule_id" => feature_flag_option_rule.id
        })

      assert %Ecto.Changeset{valid?: true} = FeatureFlagOptionRuleCondition.changeset(params)
    end

    test "when empty params, returns an invalid changeset" do
      params = %{}

      response = FeatureFlagOptionRuleCondition.changeset(params)

      assert errors_on(response) == %{
               active: ["can't be blank"],
               condition: ["can't be blank"],
               feature_flag_option_rule_id: ["can't be blank"]
             }
    end
  end
end
