defmodule FlagexWeb.FallbackController do
  use FlagexWeb, :controller

  alias FlagexWeb.ErrorView

  def call(conn, {:error, %Flagex.Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
