defmodule Flagex.FeatureFlags.OptionProcessorTest do
  use Flagex.DataCase
  import Flagex.Factory

  alias Flagex.FeatureFlags.{Result, OptionProcessor}

  describe "call/2" do
    test "when option has no rules, returns false" do
      option = build(:feature_flag_option, status: true)

      result = OptionProcessor.call(option, %{})

      assert {:ok, false} = result
    end
  end
end
