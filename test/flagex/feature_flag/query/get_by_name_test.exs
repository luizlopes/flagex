defmodule Flagex.FeatureFlag.Query.GetByNameTest do
  use Flagex.DataCase, async: true

  alias Flagex.{Error, Repo}
  alias Flagex.FeatureFlag.Query.GetByName
  alias Flagex.FeatureFlag.Schema.Flag

  describe "call/1" do
    test "when name doenst exist, returns an error" do
      assert {:error, %Error{result: "not found", status: :not_found}} ==
               GetByName.call("some_name")
    end

    test "when name doenst exist, returns a tuple" do
      params = %{name: "my_test", status: false}
      params |> Flag.changeset() |> Repo.insert()

      assert {:ok, %Flag{name: "my_test", status: false}} = GetByName.call("my_test")
    end
  end
end
