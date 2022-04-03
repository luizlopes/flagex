defmodule Flagex.FeatureFlagOptionRuleTest do
  use Flagex.DataCase, async: true

  import Flagex.Factory

  alias Flagex.{FeatureFlagOptionRule}

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      feature_flag_option = build(:feature_flag_option)

      params =
        build(:feature_flag_option_rule_params, %{
          "feature_flag_option_id" => feature_flag_option.id
        })

      assert %Ecto.Changeset{valid?: true} = FeatureFlagOptionRule.changeset(params)
    end

    test "when description has four chars, returns an invalid changeset" do
      feature_flag_option = build(:feature_flag_option)

      params =
        build(:feature_flag_option_rule_params, %{
          "description" => "four",
          "feature_flag_option_id" => feature_flag_option.id
        })

      response = FeatureFlagOptionRule.changeset(params)

      assert errors_on(response) == %{description: ["should be at least 5 character(s)"]}
    end

    test "when empty params, returns an invalid changeset" do
      params = %{}

      response = FeatureFlagOptionRule.changeset(params)

      assert errors_on(response) == %{
               description: ["can't be blank"],
               active: ["can't be blank"],
               feature_flag_option_id: ["can't be blank"]
             }
    end
  end
end
