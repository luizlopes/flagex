defmodule Flagex.FeatureFlag.Service do
  alias Flagex.FeatureFlag.Service.{CommandBuilder, ResultBuilder}
  alias Flagex.FeatureFlag.Service.GeneralHandler

  def process(name, params) do
    command = CommandBuilder.build_process_flag(name, params)

    GeneralHandler.handle(ResultBuilder.build(), command)
  end
end
