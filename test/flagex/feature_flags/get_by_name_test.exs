defmodule Flagex.FeatureFlags.GetByNameTest do
  use Flagex.DataCase, async: true

  alias Flagex.{FeatureFlag, Repo}
  alias Flagex.FeatureFlags.GetByName

  describe "call/1" do
    test "when name doenst exist, returns an error" do
      assert {:error, :not_found} == GetByName.call("some_name")
    end

    test "when name doenst exist, returns a tuple" do
      params = %{name: "my_test", status: false}
      params |> FeatureFlag.changeset() |> Repo.insert()

      assert {:ok, %FeatureFlag{name: "my_test", status: false}} = GetByName.call("my_test")
    end
  end
end
