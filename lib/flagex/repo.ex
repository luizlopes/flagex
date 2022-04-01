defmodule Flagex.Repo do
  use Ecto.Repo,
    otp_app: :flagex,
    adapter: Ecto.Adapters.Postgres
end
