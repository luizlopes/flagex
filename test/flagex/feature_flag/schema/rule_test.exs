defmodule Flagex.FeatureFlag.Schema.RuleTest do
  use Flagex.DataCase, async: true

  import Flagex.Factory

  alias Flagex.FeatureFlag.Schema.Rule

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      feature_flag_option = build(:option)

      params =
        build(:rule_params, %{
          "feature_flag_option_id" => feature_flag_option.id
        })

      assert %Ecto.Changeset{valid?: true} = Rule.changeset(params)
    end

    test "when description has four chars, returns an invalid changeset" do
      feature_flag_option = build(:option)

      params =
        build(:rule_params, %{
          "description" => "four",
          "feature_flag_option_id" => feature_flag_option.id
        })

      response = Rule.changeset(params)

      assert errors_on(response) == %{description: ["should be at least 5 character(s)"]}
    end

    test "when empty params, returns an invalid changeset" do
      params = %{}

      response = Rule.changeset(params)

      assert errors_on(response) == %{
               description: ["can't be blank"],
               active: ["can't be blank"],
               feature_flag_option_id: ["can't be blank"]
             }
    end
  end
end
