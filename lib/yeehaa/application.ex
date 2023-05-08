defmodule Yeehaa.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      YeehaaWeb.Telemetry,
      # Start the Ecto repository
      Yeehaa.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Yeehaa.PubSub},
      # Start Finch
      {Finch, name: Yeehaa.Finch},
      # Start the Endpoint (http/https)
      YeehaaWeb.Endpoint
      # Start a worker by calling: Yeehaa.Worker.start_link(arg)
      # {Yeehaa.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Yeehaa.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    YeehaaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
