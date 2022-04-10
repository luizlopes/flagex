defmodule Flagex do
  @moduledoc """
  Flagex keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias Flagex.FeatureFlag

  defdelegate process_feature_flag(name, params), to: FeatureFlag, as: :process
end
