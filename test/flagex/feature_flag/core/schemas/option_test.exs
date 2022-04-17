defmodule Flagex.FeatureFlag.Core.OptionTest do
  use Flagex.DataCase, async: true

  import Flagex.Factory

  alias Flagex.FeatureFlag.Core.Option

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      feature_flag = build(:flag)

      params =
        build(:option_params, %{
          "status" => false,
          "feature_flag_id" => feature_flag.id
        })

      assert %Ecto.Changeset{valid?: true} = Option.changeset(params)
    end

    test "when description has four chars, returns an invalid changeset" do
      feature_flag = build(:flag)

      params =
        build(:option_params, %{
          "description" => "four",
          "feature_flag_id" => feature_flag.id,
          "status" => false
        })

      response = Option.changeset(params)

      assert errors_on(response) == %{description: ["should be at least 5 character(s)"]}
    end

    test "when empty params, returns an invalid changeset" do
      params = %{}

      response = Option.changeset(params)

      assert errors_on(response) == %{
               description: ["can't be blank"],
               active: ["can't be blank"],
               status: ["can't be blank"],
               feature_flag_id: ["can't be blank"]
             }
    end
  end
end
