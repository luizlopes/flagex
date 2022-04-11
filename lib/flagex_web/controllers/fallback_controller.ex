defmodule FlagexWeb.FallbackController do
  use FlagexWeb, :controller

  alias Flagex.{Error, FeatureFlagResult}
  alias FlagexWeb.ErrorView

  def call(conn, %FeatureFlagResult{error: %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
