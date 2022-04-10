defmodule Flagex.FeatureFlag.RuleProcessorTest do
  use Flagex.DataCase
  import Flagex.Factory

  alias Flagex.FeatureFlag.RuleProcessor

  describe "call/2" do
    test "when option has no rules, returns false" do
      rule = build(:rule)

      result = RuleProcessor.call(rule, %{})

      assert {:ok, false} = result
    end
  end
end
