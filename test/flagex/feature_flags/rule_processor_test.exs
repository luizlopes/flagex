defmodule Flagex.FeatureFlags.RuleProcessorTest do
  use Flagex.DataCase
  import Flagex.Factory

  alias Flagex.FeatureFlags.{Result, RuleProcessor}

  describe "call/2" do
    test "when option has no rules, returns false" do
      rule = build(:feature_flag_option_rule)

      result = RuleProcessor.call(rule, %{})

      assert {:ok, false} = result
    end
  end
end
