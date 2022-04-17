defmodule Flagex.Result do
  @derive {Jason.Encoder, only: [:name, :status, :active, :error]}

  defstruct [:name, :status, :active, error: nil]
end
