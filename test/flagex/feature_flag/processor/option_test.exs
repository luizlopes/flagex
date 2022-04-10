defmodule Flagex.FeatureFlag.Processor.OptionTest do
  use Flagex.DataCase
  import Flagex.Factory

  alias Flagex.FeatureFlag.Processor.Option, as: OptionProcessor

  describe "call/2" do
    test "when option has no rules, returns false" do
      option = build(:option, status: true)

      result = OptionProcessor.call(option, %{})

      assert {:ok, false} = result
    end
  end
end
