defmodule Flagex.Factory do
  use ExMachina.Ecto, repo: Flagex.Repo

  alias Flagex.{FeatureFlag, FeatureFlagOption}

  def feature_flag_params_factory do
    %{
      "name" => "my_test",
      "status" => "false"
    }
  end

  def feature_flag_factory do
    %FeatureFlag{
      name: "my_test",
      status: true,
      id: 100_001
    }
  end

  def feature_flag_option_params_factory do
    %{
      "description" => "mobile",
      "active" => "true",
      "feature_flag_id" => 1
    }
  end

  def feature_flag_option_factory do
    %FeatureFlagOption{
      description: "mobile",
      id: 10_100_001,
      feature_flag_id: 100_001
    }
  end

  def feature_flag_option_rule_params_factory do
    %{
      "description" => "channel is mobile",
      "active" => "true",
      "feature_flag_option_id" => 1
    }
  end
end
