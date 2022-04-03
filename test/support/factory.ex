defmodule Flagex.Factory do
  use ExMachina.Ecto, repo: Flagex.Repo

  alias Flagex.{FeatureFlag, FeatureFlagOption, FeatureFlagOptionRule}

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
      active: true,
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

  def feature_flag_option_rule_factory do
    %FeatureFlagOptionRule{
      active: true,
      description: "payload body",
      id: 1_010_100_001,
      feature_flag_option_id: 10_100_001
    }
  end

  def feature_flag_option_rule_condition_params_factory do
    %{
      "active" => "true",
      "description" => "payload body",
      "condition" => "1 == 1",
      "feature_flag_option_rule_id" => 1
    }
  end
end
