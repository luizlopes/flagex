defmodule Flagex.FeatureFlag.Service.GetByNameQueryTest do
  use Flagex.DataCase, async: true

  alias Flagex.{Error, Repo}
  alias Flagex.FeatureFlag.Core.Flag
  alias Flagex.FeatureFlag.Service.GetByNameQuery

  describe "call/1" do
    test "when name doenst exist, returns an error" do
      assert {:error, %Error{result: "not found", status: :not_found}} ==
               GetByNameQuery.call("some_name")
    end

    test "when name doenst exist, returns a tuple" do
      params = %{name: "my_test", status: false}
      params |> Flag.changeset() |> Repo.insert()

      assert {:ok, %Flag{name: "my_test", status: false}} = GetByNameQuery.call("my_test")
    end
  end
end
