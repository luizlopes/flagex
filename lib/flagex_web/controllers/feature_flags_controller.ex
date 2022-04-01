defmodule FlagexWeb.FeatureFlagsController do
  use FlagexWeb, :controller

  def show(conn, %{"name" => name}) do
    feature_flag = %{name: name}

    conn
    |> put_status(:ok)
    |> render("show.json", feature_flag)
  end
end
