defmodule Flagex.FeatureFlagOptionTest do
  use Flagex.DataCase, async: true

  import Flagex.Factory

  alias Flagex.{FeatureFlagOption}

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      feature_flag = build(:feature_flag)

      params = build(:feature_flag_option_params, %{"feature_flag_id" => feature_flag.id})

      assert %Ecto.Changeset{valid?: true} = FeatureFlagOption.changeset(params)
    end

    test "when description has four chars, returns an invalid changeset" do
      feature_flag = build(:feature_flag)

      params =
        build(:feature_flag_option_params, %{
          "description" => "four",
          "feature_flag_id" => feature_flag.id
        })

      response = FeatureFlagOption.changeset(params)

      assert errors_on(response) == %{description: ["should be at least 5 character(s)"]}
    end

    test "when empty params, returns an invalid changeset" do
      params = %{}

      response = FeatureFlagOption.changeset(params)

      assert errors_on(response) == %{
               description: ["can't be blank"],
               active: ["can't be blank"],
               feature_flag_id: ["can't be blank"]
             }
    end
  end
end
