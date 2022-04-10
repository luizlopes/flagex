defmodule Flagex.FeatureFlag.ProcessorTest do
  use Flagex.DataCase
  import Flagex.Factory

  alias Flagex.FeatureFlag.{Result, Processor}

  describe "call/2" do
    test "when params is empty, return feature flag result" do
      feature_flag = build(:flag, status: false)

      result = Processor.call(feature_flag, %{})

      assert %Result{name: "my_test", status: false, active: true, errors: false} = result
    end

    test "when params is filled and FeatureFlag has no options, return feature flag result" do
      feature_flag = build(:flag, status: false)

      result = Processor.call(feature_flag, %{"channel" => "website"})

      assert %Result{name: "my_test", status: false, active: true, errors: false} = result
    end

    test "when params is filled and FeatureFlag is complete, return condition result" do
      condition = build(:condition, condition: "channel == \"website\"")
      rule = build(:rule, conditions: [condition])
      option = build(:option, status: true, rules: [rule])
      feature_flag = build(:flag, status: false, options: [option])

      result = Processor.call(feature_flag, %{"channel" => "website"})

      assert %Result{name: "my_test", status: true, active: true, errors: false} = result
    end

    test "when params is filled and FeatureFlag has options, return feature flag result" do
      option = build(:option, status: true)
      feature_flag = build(:flag, status: false, options: [option])

      result = Processor.call(feature_flag, %{"channel" => "website"})

      assert %Result{name: "my_test", status: false, active: true, errors: false} = result
    end
  end
end
