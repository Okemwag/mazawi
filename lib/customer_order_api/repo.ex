defmodule CustomerOrderApi.Repo do
  use Ecto.Repo,
    otp_app: :customer_order_api,
    adapter: Ecto.Adapters.Postgres
end
