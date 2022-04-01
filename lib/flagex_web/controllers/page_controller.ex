defmodule FlagexWeb.PageController do
  use FlagexWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
