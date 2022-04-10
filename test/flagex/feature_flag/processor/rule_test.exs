defmodule Flagex.FeatureFlag.Processor.RuleTest do
  use Flagex.DataCase
  import Flagex.Factory

  alias Flagex.FeatureFlag.Processor.Rule, as: RuleProcessor

  describe "call/2" do
    test "when option has no rules, returns false" do
      rule = build(:rule)

      result = RuleProcessor.call(rule, %{})

      assert {:ok, false} = result
    end
  end
end
