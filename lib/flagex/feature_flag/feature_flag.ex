defmodule Flagex.FeatureFlag do
  alias Flagex.FeatureFlag.Builder.Command, as: CommandBuilder
  alias Flagex.FeatureFlag.Builder.Result, as: ResultBuilder
  alias Flagex.FeatureFlag.Handler.Command, as: CommandHandler

  def process(feature_flag_name, params) do
    process_flag_command = CommandBuilder.build_process_flag(feature_flag_name, params)

    CommandHandler.call(ResultBuilder.build(), process_flag_command)
  end
end
