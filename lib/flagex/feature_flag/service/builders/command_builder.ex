defmodule Flagex.FeatureFlag.Service.CommandBuilder do
  alias Flagex.FeatureFlag.Service.Command

  def build_process_flag(name, params) do
    %Command{type: :process_flag, options: %{name: name, params: params}}
  end
end
