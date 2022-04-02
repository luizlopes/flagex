defmodule Flagex.FeatureFlags.ProcessorTest do
  use Flagex.DataCase

  alias Flagex.FeatureFlags.{Result, Processor}
  alias Flagex.{FeatureFlag, Repo}

  describe "call/2" do
    test "when params is empty, return feature flag result" do
      {:ok, feature_flag} =
        %{name: "my_test", status: false} |> FeatureFlag.changeset() |> Repo.insert()

      result = Processor.call(feature_flag, %{})

      assert %Result{name: "my_test", status: false, active: true, errors: false}
    end
  end
end
