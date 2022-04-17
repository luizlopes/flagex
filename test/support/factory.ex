defmodule Flagex.Factory do
  use ExMachina.Ecto, repo: Flagex.Repo

  alias Flagex.FeatureFlag.Core.{Condition, Flag, Option, Rule}

  def flag_params_factory do
    %{
      "name" => "my_test",
      "status" => "false"
    }
  end

  def flag_factory do
    %Flag{
      name: "my_test",
      status: true,
      id: 100_001
    }
  end

  def option_params_factory do
    %{
      "description" => "mobile",
      "active" => "true",
      "flag_id" => 1
    }
  end

  def option_factory do
    %Option{
      active: true,
      description: "mobile",
      id: 10_100_001,
      feature_flag_id: 100_001
    }
  end

  def rule_params_factory do
    %{
      "description" => "channel is mobile",
      "active" => "true",
      "feature_flag_option_id" => 1
    }
  end

  def rule_factory do
    %Rule{
      active: true,
      description: "payload body",
      id: 1_010_100_001,
      feature_flag_option_id: 10_100_001
    }
  end

  def condition_params_factory do
    %{
      "active" => "true",
      "description" => "payload body",
      "condition" => "1 == 1",
      "feature_flag_option_rule_id" => 1
    }
  end

  def condition_factory do
    %Condition{
      active: true,
      description: "payload body",
      condition: "1==1",
      id: 100_010_100_001,
      feature_flag_option_rule_id: 1_010_100_001
    }
  end
end
