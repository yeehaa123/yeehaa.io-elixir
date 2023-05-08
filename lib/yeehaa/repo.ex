defmodule Yeehaa.Repo do
  use Ecto.Repo,
    otp_app: :yeehaa,
    adapter: Ecto.Adapters.Postgres
end
