defmodule Flagex.FeatureFlags.ProcessorTest do
  use Flagex.DataCase
  import Flagex.Factory

  alias Flagex.FeatureFlags.{Result, Processor}

  describe "call/2" do
    test "when params is empty, return feature flag result" do
      feature_flag = build(:feature_flag, status: false)

      result = Processor.call(feature_flag, %{})

      assert %Result{name: "my_test", status: false, active: true, errors: false} = result
    end

    test "when params is filled and FeatureFlag has no options, return feature flag result" do
      feature_flag = build(:feature_flag, status: false)

      result = Processor.call(feature_flag, %{"channel" => "website"})

      assert %Result{name: "my_test", status: false, active: true, errors: false} = result
    end

    test "when params is filled and FeatureFlag is complete, return condition result" do
      condition = build(:feature_flag_option_rule_condition, condition: "channel == \"website\"")
      rule = build(:feature_flag_option_rule, feature_flag_option_rule_conditions: [condition])
      option = build(:feature_flag_option, status: true, feature_flag_option_rules: [rule])
      feature_flag = build(:feature_flag, status: false, feature_flag_options: [option])

      result = Processor.call(feature_flag, %{"channel" => "website"})

      assert %Result{name: "my_test", status: true, active: true, errors: false} = result
    end

    test "when params is filled and FeatureFlag has options, return feature flag result" do
      option = build(:feature_flag_option, status: true)
      feature_flag = build(:feature_flag, status: false, feature_flag_options: [option])

      result = Processor.call(feature_flag, %{"channel" => "website"})

      assert %Result{name: "my_test", status: false, active: true, errors: false} = result
    end
  end
end
