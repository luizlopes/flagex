defmodule FlagexWeb.FallbackController do
  use FlagexWeb, :controller

  alias Flagex.{Error, Result}
  alias FlagexWeb.ErrorView

  def call(conn, %Result{error: %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
