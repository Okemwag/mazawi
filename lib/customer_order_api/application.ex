defmodule CustomerOrderApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CustomerOrderApiWeb.Telemetry,
      CustomerOrderApi.Repo,
      {DNSCluster, query: Application.get_env(:customer_order_api, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: CustomerOrderApi.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: CustomerOrderApi.Finch},
      # Start a worker by calling: CustomerOrderApi.Worker.start_link(arg)
      # {CustomerOrderApi.Worker, arg},
      # Start to serve requests, typically the last entry
      CustomerOrderApiWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CustomerOrderApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CustomerOrderApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
