defmodule Flagex.FeatureFlag.Core.FlagTest do
  use Flagex.DataCase, async: true

  alias Flagex.FeatureFlag.Core.Flag

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "my_test", status: true}

      assert %Ecto.Changeset{valid?: true} = Flag.changeset(params)
    end

    test "when name has four chars, returns an invalid changeset" do
      params = %{name: "test", status: true}

      response = Flag.changeset(params)

      assert errors_on(response) == %{name: ["should be at least 5 character(s)"]}
    end

    test "when empty params, returns an invalid changeset" do
      params = %{}

      response = Flag.changeset(params)

      assert errors_on(response) == %{name: ["can't be blank"], status: ["can't be blank"]}
    end
  end
end
