defmodule Flagex.FeatureFlag.Processor.FlagTest do
  use Flagex.DataCase
  import Flagex.Factory

  alias Flagex.FeatureFlagResult, as: Result
  alias Flagex.FeatureFlag.Processor.Flag, as: FlagProcessor

  describe "call/2" do
    test "when params is empty, return feature flag result" do
      feature_flag = build(:flag, status: false)

      result = FlagProcessor.call(feature_flag, %{})

      assert %Result{name: "my_test", status: false, active: true, error: nil} = result
    end

    test "when params is filled and FeatureFlag has no options, return feature flag result" do
      feature_flag = build(:flag, status: false)

      result = FlagProcessor.call(feature_flag, %{"channel" => "website"})

      assert %Result{name: "my_test", status: false, active: true, error: nil} = result
    end

    test "when params is filled and FeatureFlag is complete, return condition result" do
      condition = build(:condition, condition: "channel == \"website\"")
      rule = build(:rule, conditions: [condition])
      option = build(:option, status: true, rules: [rule])
      feature_flag = build(:flag, status: false, options: [option])

      result = FlagProcessor.call(feature_flag, %{"channel" => "website"})

      assert %Result{name: "my_test", status: true, active: true, error: nil} = result
    end

    test "when params is filled and FeatureFlag has options, return feature flag result" do
      option = build(:option, status: true)
      feature_flag = build(:flag, status: false, options: [option])

      result = FlagProcessor.call(feature_flag, %{"channel" => "website"})

      assert %Result{name: "my_test", status: false, active: true, error: nil} = result
    end
  end
end
