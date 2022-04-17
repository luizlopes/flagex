defmodule Flagex.Error do
  @keys [:status, :result]
  @enforce_keys @keys

  defstruct @keys

  def build(status, result) do
    %__MODULE__{
      status: status,
      result: result
    }
  end

  def build_not_found_error, do: build(:not_found, "not found")
  def build_invalid_id_format_error, do: build(:bad_request, "Invalid id format")
end
