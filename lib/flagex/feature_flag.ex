defmodule Flagex.FeatureFlag do
  alias Flagex.FeatureFlag.Service

  defdelegate process(name, params), to: Service
end
