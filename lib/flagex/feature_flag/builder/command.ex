defmodule Flagex.FeatureFlag.Builder.Command do
  alias Flagex.FeatureFlag.Command

  def build_process_flag(name, params) do
    options = %{name: name, params: params}
    %Command{type: :process_flag, options: options}
  end
end
